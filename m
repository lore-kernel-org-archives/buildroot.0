From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Sep 2016 10:14:28 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-08
In-Reply-To: <09e2a649-7606-8726-520f-c33934424413@free.fr>
References: <20160809063032.89898101A55@stock.ovh.net>
 <20160809141535.4c9b8169@free-electrons.com>
 <17850212-c769-63c4-f05b-79adc47f470c@gmail.com>
 <34622bb9-7ff7-2d15-fa97-e5ed6570034b@gmail.com>
 <2e0ca47d-83cf-4c2d-844b-9560b98733c3@free.fr>
 <81bcbe49-664c-6d7d-f12c-e4b66c53a91a@mind.be>
 <09e2a649-7606-8726-520f-c33934424413@free.fr>
Message-ID: <24787add-75fb-ff38-fc57-3bbf6626322d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-09-16 17:05, Julien Boibessot wrote:
> Hello,
> 
> Arnout,
> 
> On 26/08/2016 00:37, Arnout Vandecappelle wrote:
[snip]
>>  Looking at the source of edje_cc, it's mkstemp() that fails. Do you have TMPDIR
>> or XDG_RUNTIME_DIR pointing to some location that is not writable or doesn't exist?
> 
> XDG_RUNTIME_DIR is indeed pointing to a directory that is not writable
> for user launching the build.
> export XDG_RUNTIME_DIR=/tmp fixes the host-efl build.
> Where should I set this envt variable ?
> 
> (Build is launched through ssh+su on my build server)

 I guess you should unset XDG_RUNTIME_DIR somewhere in that script :-) Or maybe
buildroot-test should do that? AFAICS it currently doesn't do any environment
cleanups, but maybe it should?

 Regards,
 Arnout

> 
> Regards,
> Julien
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
