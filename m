From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 17:12:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/mplayer: disable inline sse on
 i386
In-Reply-To: <XnsA776E64284194berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20170513150918.25427-1-bernd.kuhls@t-online.de>
 <20170514160855.2dea324b@free-electrons.com>
 <XnsA776E64284194berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <5b884a7c-9147-12e0-e6e7-c6f71d82f089@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bernd,

 Coming back to this ancient series...

On 15-05-17 22:38, Bernd Kuhls wrote:
> [posted and mailed]
> 
> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
> @public.gmane.org> wrote in news:20170514160855.2dea324b at free-electrons.com:
> 
>> All of this is very messy. Why isn't the ffmpeg code building properly
>> on x86 ? It's a major platform, shouldn't x86 just work ?
> 
> Hi Thomas,
> 
> honestly I have no idea what causes the problem. Maybe activating inline asm 
> on x86 at all is a problem due to hardware constraints as described here: 
> http://stackoverflow.com/questions/8275859/error-cant-find-a-register-in-
> class-general-regs-while-reloading-asm ?


 Looking at current mplayer build failures, they seem slightly different than
the errors you report in the three patches here.

 With all the fixes we need for mplayer's bundled ffmpeg, why don't we just
switch to ffmpeg itself? mplayer upstream doesn't seem to advise against it,
Debian doesn't use the bundled one, so why not? OK, it will probably be some
effort to unbundle it, but I think it's more future-safe that way.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
