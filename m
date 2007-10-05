From: Kuten Ivan <ivan.kuten@promwad.com>
Date: Fri, 05 Oct 2007 10:12:31 -0100
Subject: [Buildroot] Make install-exec not working
In-Reply-To: <878a2ed60710050156h65135ff9mc74e857825f9b89@mail.gmail.com>
References: <878a2ed60710050156h65135ff9mc74e857825f9b89@mail.gmail.com>
Message-ID: <47061C1F.4050201@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandru Tudose wrote:
> I have compiled X11R7 packages on x86_64 system for x86 architecture,
> but most of them haven't been installed in target directory, but they
> appear in staging directory. I found that install-exec is not working
> after modifying in Makefile.autotools.in:
> 
> $(2)_INSTALL_TARGET_OPT         ?= DESTDIR=$$(TARGET_DIR)  install-exec
> to
> $(2)_INSTALL_TARGET_OPT         ?= DESTDIR=$$(TARGET_DIR)  install.
> 
> Can someone confirm that it is a x86_64 bug?
> As usual message: "fixed font not found", but it start after
> installing font-misc-misc package.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

It's generic X11R7 bug. I have the same for arm arch.
To run X I had to copy manually to target dir.

Best regards,
Ivan

--------------------------------
> Embedded Linux engineer,
> Promwad Company: http://www.promwad.com/
> Homepage : http://www.ivankuten.com/
> --------------------------------
