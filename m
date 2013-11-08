From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Nov 2013 09:33:30 +0100
Subject: [Buildroot] Problems to build udev on 2013.08.1
In-Reply-To: <527C9EF1.1020905@edag.de>
References: <527C9EF1.1020905@edag.de>
Message-ID: <20131108093330.5d32ce2c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Katzmann,

On Fri, 08 Nov 2013 09:21:05 +0100, Peter Katzmann wrote:

> i have two buildroot projects. One requires udev.
> I get always the same error (at the end).
> So i took my second project, enabled udev there also and the same
> error. One project is with linaroo and the other one with eglibc/gcc.
> I also tried the build on different Platforms (Opensuse 12.3/13.1
> Ubuntu 10.04/12.04/13.10), always the same problem.
> 
> It seems that somewhere a wrong link or duplicating of the path leads
> to the error.
> 
> Attached is the config of the eglibc project.
> 
> peter
> 
>    CCLD   collect
> libtool: link: warning: library 
> `/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libblkid.la' 
> was moved.

Building from a path that starts with /usr is not supported. This is
something we have to fix, but it hasn't been done so far.

See https://bugs.busybox.net/show_bug.cgi?id=6470.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
