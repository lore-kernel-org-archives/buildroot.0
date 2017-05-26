From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 26 May 2017 08:14:20 -0500
Subject: [Buildroot] [PATCH v3 1/2] package/avrdude: enable linuxgpio by
	default
Message-ID: <1495804461-33097-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Voss <samuel.voss@rockwellcollins.com>

Enable linux sysfs gpio framework cfg opt.

Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

v2 -> v3
 - Set linuxgpio to default (Suggested by Baruch)

v1 -> v2
 - upstream accepted linux gpio fix, removed patch
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
-- 
1.9.1
