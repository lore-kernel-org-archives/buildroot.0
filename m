From: Alexandru Tudose <alextud@gmail.com>
Date: Fri, 5 Oct 2007 11:56:52 +0300
Subject: [Buildroot] Make install-exec not working
Message-ID: <878a2ed60710050156h65135ff9mc74e857825f9b89@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have compiled X11R7 packages on x86_64 system for x86 architecture,
but most of them haven't been installed in target directory, but they
appear in staging directory. I found that install-exec is not working
after modifying in Makefile.autotools.in:

$(2)_INSTALL_TARGET_OPT         ?= DESTDIR=$$(TARGET_DIR)  install-exec
to
$(2)_INSTALL_TARGET_OPT         ?= DESTDIR=$$(TARGET_DIR)  install.

Can someone confirm that it is a x86_64 bug?
As usual message: "fixed font not found", but it start after
installing font-misc-misc package.
