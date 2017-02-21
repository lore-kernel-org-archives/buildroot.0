From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Feb 2017 09:05:01 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <20170220134111.1bc02a9f@free-electrons.com>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr> <20170220134111.1bc02a9f@free-electrons.com>
Message-ID: <b94b135b-35c2-ad80-9a99-f14ebfea1e06@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-02-17 13:41, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks a lot for doing this analysis. A few comments below.
> 
> On Fri, 17 Feb 2017 22:12:42 +0100, Yann E. MORIN wrote:
> 
>> On 2017-02-17 08:28 +0100, Thomas Petazzoni spake thusly:
[snip]
>>> microblazeel | make[4]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/92c165a970b9d8912c5ca50ed3567478cd2a2b3d  
>>
>> Timeout, but weird: the ffmpeg build started at 3850 seconds (a bit more
>> than one hour) and the timeout is supposed to be 8h, so the ffmpeg build
>> did not finish after about 7h...
> 
> Perhaps an infinite loop in the compiler. Happens sometimes on complex
> code such as ffmpeg, and not very widely used architectures such as
> microblaze.

 Perhaps for the timeout, it would make sense to do a setrlimit(RLIMIT_CPU) in
addition to the monitor. That way you avoid that a single compile stays stuck
for 7 hours. Though admittedly at the moment it happens sufficiently rarely to
not be too much of a waste.

>>>         sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/2944568f9623f1377e987a1dadde5ea8cc428c5f  
>>
>>     error: 'SIZE_MAX' was not declared in this scope
>>
>> Missing header? Samuel?
> 
> This is the same issue as the one fixed for libraw in
> d246cf5fd01bb0d20a0e64194ffed514ea8dd0aa. It's annoying that the issue
> is in the jasper package, but we have to fix it in all packages using
> jasper. Not sure what can be done about it though.

 Actually, only the packages that use C++. AFAICS that's just kodi, libraw,
opencv and opencv3.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
