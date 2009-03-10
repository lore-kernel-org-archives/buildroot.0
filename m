From: Karl Krach <mailinglists@blueSpirit.la>
Date: Tue, 10 Mar 2009 07:43:20 +0100
Subject: [Buildroot] socket(PF_FILE, SOCK_STREAM, 0) not implemented
Message-ID: <kga2o8.4opixu@webmail.variomedia.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will Newton <will.newton@gmail.com> schrieb:
> >
> > Hello,
> >
> > I have an arm handheld device with kernel 2.4.19 and am working
> > with qt 3.3, gcc version 2.95 and glibc.
> >
> > [...]
> >
> > brk(0x137f4) ? ? ? ? ? ? ? ? ? ?= 0x137f4
> > brk(0x14000) ? ? ? ? ? ? ? ? ? ?= 0x14000
> > socket(PF_FILE, SOCK_STREAM, 0) = -1 ENOSYS
> >                                  (Function not implemented)
> > stat64("/root/Settings/Trolltech.conf", 0xbffff2d8) = -1 ENOENT
> >
> > [...]
> >
> 
> It looks as if the kernel headers you built uClibc with do not match
> your kernel.
> 
Yes, of course - you re right. I'm using the kernel headers which are
downloaded and installed by buildroot (2.5.28.x). Provides the buildroot
configuration a way to used custom kernel headers? What do you think, is there
a chance to get it working with a 2.4 kernel?

Now I'm going to fix it manually (by replacing the kernel header files in
"toolchain_build_arm/linux") and will report how far I get.

Charly
