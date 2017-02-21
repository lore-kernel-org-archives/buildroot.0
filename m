From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Feb 2017 09:46:03 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <20170221092754.3dd7bc65@free-electrons.com>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr> <20170220134111.1bc02a9f@free-electrons.com>
 <b94b135b-35c2-ad80-9a99-f14ebfea1e06@mind.be>
 <20170221092754.3dd7bc65@free-electrons.com>
Message-ID: <05d32cf1-16bf-98c5-a62a-d1ea4ea8ad11@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-02-17 09:27, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 21 Feb 2017 09:05:01 +0100, Arnout Vandecappelle wrote:
> 
>>  Perhaps for the timeout, it would make sense to do a setrlimit(RLIMIT_CPU) in
>> addition to the monitor. That way you avoid that a single compile stays stuck
>> for 7 hours. Though admittedly at the moment it happens sufficiently rarely to
>> not be too much of a waste.
> 
> So doing "ulimit -t 60" will for example prevent a single process from
> getting more than 60 seconds of CPU time ?

 Indeed. At least, I think so :-) According to the setrlimit man page, the
limits are inherited by child processes. And as far as I can see, the limit only
applies to the process's own CPU time, not the cumulative time including children.

> But I agree, it doesn't happen that often, so probably not worth the
> effort.
> 
>>>>>         sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/2944568f9623f1377e987a1dadde5ea8cc428c5f    
>>>>
>>>>     error: 'SIZE_MAX' was not declared in this scope
>>>>
>>>> Missing header? Samuel?  
>>>
>>> This is the same issue as the one fixed for libraw in
>>> d246cf5fd01bb0d20a0e64194ffed514ea8dd0aa. It's annoying that the issue
>>> is in the jasper package, but we have to fix it in all packages using
>>> jasper. Not sure what can be done about it though.  
>>
>>  Actually, only the packages that use C++. AFAICS that's just kodi, libraw,
>> opencv and opencv3.
> 
> Correct. But still, that's a bit annoying to have to change all the
> consumers of a package.


 An alternative would be to patch jasper itself to define __STDC_LIMIT_MACROS in
its headers. Far-reaching, but probably harmless. Not sure if such a patch would
be upstreamable though.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
