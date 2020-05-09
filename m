From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 18:46:55 +0200
Subject: [Buildroot] [PATCH] package/gcc9: Fix parallel build problem
 (xgcc not found)
In-Reply-To: <1d1703f1-65b3-a17a-c6aa-2d7be1647af3@inbox.ru>
References: <b60c5da0-cf8e-3f5b-d271-659345733aff@inbox.ru>
 <20200507215817.48d744be@windsurf.home>
 <1d1703f1-65b3-a17a-c6aa-2d7be1647af3@inbox.ru>
Message-ID: <20200509184655.62724518@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 8 May 2020 15:40:25 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

>  > Do you have more details about this failure? Does it happen in our
>  > autobuilders? In which context?  
> 
> Similar issue described here: 
> https://github.com/cirosantilli/linux-kernel-module-cheat/issues/108
> 
> I don't know about your autobuilder.

Our autobuilders are most likely not testing so much the gcc 9.x build,
since Buildroot still defaults to gcc 8.x.

> In my config I use CCACHE for build (try 3.6, 3.7.9 with the same 
> result). May be it affect some timings/delay in build sequence.
> 
> It fails for gcc-final (9.2 and 9.3):
> /builds/kochetkov.m/buildroot/output/build/host-gcc-final-9.3.0/build/./gcc/xgcc 
> -B/builds/kochetkov.m/buildroot/output/build/host-gcc-final-9.3.0/build/./gcc/ 
> -xc -nostdinc /dev/null -S -o /dev/null 
> -fself-test=../../gcc/testsuite/selftests
> /bin/bash: 
> /builds/kochetkov.m/buildroot/output/build/host-gcc-final-9.3.0/build/./gcc/xgcc: 
> No such file or directory
> 
> gcc build systems is trying to test compiled executables (xgcc xg++ ....)

Is this only with gcc 9.x ? It doesn't appear with 8.x ? Why ?

In Buildroot, we generally try to rely understand issues and fix them
upstream, rather than just papering over the problem with the first
workaround available.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
