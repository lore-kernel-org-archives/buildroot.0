From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:25:49 +0200
Subject: [Buildroot] [git commit] package/avrdude: enable linuxgpio by
	default
Message-ID: <20170601202857.607FA82863@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af199a16db67cccda28595acc6ff818891f376ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable linux sysfs gpio framework cfg opt.

Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avrdude/avrdude.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index f914ed7..c379707 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -12,6 +12,7 @@ AVRDUDE_SUBDIR = avrdude
 # Sources coming from git, without generated configure and Makefile.in
 # files.
 AVRDUDE_AUTORECONF = YES
+AVRDUDE_CONF_OPTS = --enable-linuxgpio
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 AVRDUDE_LICENSE = GPL-2.0+
