From: Dimitry Golubovsky <golubovsky@gmail.com>
Date: Thu, 3 May 2012 06:32:35 -0400
Subject: [Buildroot] read-edid package - clarifications
Message-ID: <CADiAo4K90x6ZANyvQk7SYP=o=YmimOHDn+wfHLSrwE7bumcLKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks to Baruch and Thomas for the comments. I'll try to implement them.

Few thoughts though:

Thomas' comment:

> non-essential binaries should probably live in usr/bin/ rather than bin/.

I think such program may be needed rather early in the boot process.
Basically it is needed when setting up the framebuffer console
resolution. I have a real case of Via Unichrome and a Dell widescreen
monitor where the framebuffer driver is unable to sense the monitor
(X.org driver does fine though), so the only way for me to initialize
the console was to run read-edid even before I am attempting to load
the framebuffer drivers and fbcon. That's why I placed it into /bin
(or maybe it is even better in /sbin).

Baruch's comment:

> read-edid can only run on x86 PCs and PowerPC Macs, so it should depend on
> (BR2_i386 || BR2_x86_64 || BR2_powerpc).

I only tested it on i386, not sure about x86-64, and definitely not on
powerpc as it has x86 real-mode stuff in it. So perhaps I'll keep i386
only.

Thanks.

-- 
Dimitry Golubovsky

Anywhere on the Web
