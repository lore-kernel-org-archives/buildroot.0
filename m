From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 12:18:30 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <20160629155233.510c456e@free-electrons.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <20160629155233.510c456e@free-electrons.com>
Message-ID: <77293ee3-6e4c-7342-214d-adffdde679f8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29-06-16 15:52, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 29 Jun 2016 15:46:07 +0200, Julien Floret wrote:
>> A lot of host packages are never built, because they don't have a
>> Config.in option, and are never referenced in other packages'
>> dependencies.
>>
>> This series removes them to avoid maintaining unneeded code; they
>> will still be in git history if some are needed again in the future.
>>
>> The other motivation behind this cleanup is that I'm starting to think
>> about a new proposal for speeding up the Makefile parsing, similar to
>> what Thomas proposed here:
>> http://lists.busybox.net/pipermail/buildroot/2014-March/092548.html
>>
>> As Thomas explained, this change would imply adding blind Config.in
>> options for all host packages. It's quite a big change, so a little
>> preliminary cleanup could help.
> 
> I haven't looked at the series, but did you take into account that just
> grepping for "host-foo" is not sufficient to know if the host-foo
> package is used or not?
> 
> Indeed, if a package has:
> 
> BAR_DEPENDENCIES = foo
> 
> then host-bar automatically has a dependency on host-foo, without
> host-foo being written anywhere.

 That automatic derivation of dependencies of host packages sounded like a good
idea at the time, but it can really bite you. Of the 200 host packages that we
have at the moment, there are just 64 that use the inheritance - and many of
them are in Julien's list here (possibly incorrectly).

 So, as the person who introduced this mis-feature, I'm the first one to vote
for removing it again.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
