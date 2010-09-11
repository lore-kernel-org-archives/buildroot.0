From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Sep 2010 10:52:01 +0200
Subject: [Buildroot] Build error "cannot find -lc"
In-Reply-To: <KAW101-W9A50593711791769ABB3C9B740@phx.gbl>
References: <KAW101-W9A50593711791769ABB3C9B740@phx.gbl>
Message-ID: <20100911105201.176d1396@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Sep 2010 07:16:46 +0900
S W <sw18@hotmail.co.jp> wrote:

> I am using Buildroot-2010.08 to create a arm-linux kernel,
> but I encountered an error message like
> /usr/bin/ld: cannot find -lc
> 
> And I attached the whole output message with this email.
> 
> Would anyone please give me any advice?

Which distro are you using ?

Here, host-module-init-tools is trying to link statically the insmod
program, so it needs the static version of the C library, which does
not seem to be avaible on your system.

Some distributions (especially RPM based distro it seems, like
RedHat, Fedora, Mandriva and OpenSuse) ship this as a separate package,
sometimes named "glibc-static" or something similar. Anyhow, you should
have a "libc.a" file, either in /lib or /usr/lib, for this to work.
Just find the package of your distro that contains it.

Can you check this out, and report to us, so that we can implement
something to warn out users about this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
