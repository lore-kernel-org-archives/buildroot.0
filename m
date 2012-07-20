From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 10:07:38 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-07-19
In-Reply-To: <20120720063154.B72D2521B8C@lolut.humanoidz.org>
References: <20120720063154.B72D2521B8C@lolut.humanoidz.org>
Message-ID: <20120720100738.434746e8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 08:31:54 +0200 (CEST),
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> 
> Hello,
> 
> On 2012-07-19, 127 random build tests have been done and
> submitted on autobuild.buildroot.net.
>  71 builds have been successful
>  56 builds have failed

Maxime Ripard and I had a look at those not very good build results.
Basically, most of the new build failures were caused by two things:

 (*) Luajit failing to build on my build server. This was due to the
     fact that my build server is x86_64, and when Luajit builds for a
     32 bits architecture, it needs a multilib capable compiler. My
     build server simply lacked the libc6-dev-i386 development package.
     It has now been installed, so it should hopefully fix those build
     issues.

     It also means that having a multilib capable compiler is not a
     prerequisite of Buildroot on x86_64, at least to build Luajit for
     32 bits architecture. But I think we were planning to also use it
     to build Grub anyway, so it looks like this is becoming a common
     requirement. So far, we haven't added a test for this in our
     host dependency checking.

 (*) Libfreefare was failing to build after the bump of libnfc. I have
     applied Simon's patch to bump Libfreefare, which from a quick build
     test, is solving this build problem.

Hopefully, tomorrow's results will be better.

Please feel free to investigate some of the other build failures.
Patches welcome.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
