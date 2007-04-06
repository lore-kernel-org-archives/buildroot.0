From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 6 Apr 2007 18:39:50 +0200
Subject: [Buildroot] frame buffer problems
In-Reply-To: <2034.63.193.249.101.1175876073.squirrel@webmail.aerende.com>
References: <2034.63.193.249.101.1175876073.squirrel@webmail.aerende.com>
Message-ID: <20070406163950.GA6131@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 06, 2007 at 09:14:33AM -0700, nina.holly at aerende.com wrote:
>Hi,
>    I am using Linux 2.6.10 with devfs on ARM.  I know that
>devfs is deprecated/obsolete.  The framebuffer works fine
>with buildroot svn version 15763.  But when I switched to
>buildroot version 17224 I get a return value < 0 when I try to execute
>
>ioctl(frame_buffer_ptr, FBIOGET_VSCREENINFO, &var_info);
>
>I.E. I can't read the basic frame buffer information.
>
>1.  Is this a problem in the version of buildroot that I am using?
>
>2.  Is this because buildroot version 17224 doesn't work
>    with devfs and I need to switch to using udev?
>
>3.  Do I need to use Linux version greater than 2.6.15 (which works
>    with udev) to work with buildroot version 17224?

I'm using 2.6.20.4 with binutils-2.17.50.0.14 and gcc-4.2. I have
BR2_PACKAGE_BUSYBOX_CONFIG="busybox.config"
BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
BR2_PACKAGE_BUSYBOX_SKELETON=y
and use mdev (from buysbox trunk) to create my device nodes, dunno
about udev and don't want to know about devfs anymore ;)
I do use sysfs and configfs, though, the former is required for mdev to
work.

Works fine for me, fwiw.
