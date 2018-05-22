From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 May 2018 12:41:33 +0200
Subject: [Buildroot] [PATCH] pkg-generic: error out with 'local' site
 method and no _SITE
In-Reply-To: <20180519103814.5cf1abae@windsurf>
References: <20180518104524.4630-1-arnout@mind.be>
 <20180519103814.5cf1abae@windsurf>
Message-ID: <9ba18873-320c-0296-e2be-94f00d180ac4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-05-18 10:38, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 18 May 2018 12:45:24 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> +ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>> +$$(error $(1) has local site method, but `$(2)_SITE_METHOD` is not defined)
>> +endif
> 
> Are you sure it shouldn't be "$(2)_SITE" is not defined ?

 That was actually intentional. The idea is to allow 'local' packages to set
either _SITE or _OVERRIDE_SRCDIR. The check comes after the assignment to
_OVERRIDE_SRCDIR. The reason for this is: currently, 'local' packages work
correctly if you set _OVERRIDE_SRCDIR instead of _SITE, and I don't see a reason
to make them fail.

 I probably should have explained this in the commit log. It was a bit short :-)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
