From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 26 May 2014 20:31:00 +0200
Subject: [Buildroot] [PATCH 0/1] WIP: libudev: New package
Message-ID: <1401129061-25216-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

in reply to Thomas[1]: "Gentoo has decided to provide a maintained fork of udev
as eudev, so we support both options. But I definitely wouldn't want to support
things that are completely Buildroot-specific."

for my first libudev package, based on systemd sourcecode, aimed at platforms
having  BR2_ROOTFS_DEVICE_CREATION_STATIC=y I picked up his hint. This libudev
package is now based on eudev sourcecode in a less hackish way. Even the Gentoo
ebuild[2] partly uses "$(MAKE) -C $(@D)/src/libudev".

This package install these files to $(STAGING_DIR):
./usr/include/libudev.h
./usr/lib/libudev.la
./usr/lib/libudev.a
./usr/lib/pkgconfig/libudev.pc
./usr/lib/libudev.so -> ../../lib/libudev.so.1.4.0
./lib/libudev.so.1.4.0
./lib/libudev.so.1 -> libudev.so.1.4.0

I am planning to merge this libudev package and the existing eudev package, but
I am not sure what is the best way. This is something I would like to discuss
based on this patch. My idea is to compile libudev using eudev.mk for platforms
without a udev daemon. Therefore this patch should not be committed as is.

Btw, I am using this package successfully to provide udev device detection
support to libcec, which in turn is used by xbmc to find my cec adapter without
hacking xbmc, which I did in the past ;)

Regards, Bernd

[1] http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/83953
[2] http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-fs/eudev/eudev-1.6.ebuild

-- 
1.7.10.4
