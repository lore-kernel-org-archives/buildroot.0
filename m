From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Tue,  4 Oct 2016 07:44:12 -0300
Subject: [Buildroot] [PATCH] elfutils: clarify licensing info
Message-ID: <1475577852-15870-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

elfutils libraries are GPLv2 or LGPLv3+, standalone programs are GPLv3+
(see the NEWS file).
Make the GPLv3+ license tag/file dependant on the programs being
enabled, and make the GPLv2/LGPLv3+ tag more descriptive.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/elfutils/elfutils.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 6af1223..5026474 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -8,10 +8,16 @@ ELFUTILS_VERSION = 0.166
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
-ELFUTILS_LICENSE = GPLv3, GPLv2, LGPLv3
-ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
+ELFUTILS_LICENSE = GPLv2 or LGPLv3+ (library)
+ELFUTILS_LICENSE_FILES = COPYING-GPLV2 COPYING-LGPLV3
 ELFUTILS_DEPENDENCIES = zlib
 
+# Programs are GPLv3+ so add it when they're enabled
+ifeq ($(BR2_PACKAGE_ELFUTILS_PROGS),y)
+ELFUTILS_LICENSE += GPLv3+ (programs)
+ELFUTILS_LICENSE_FILES += COPYING
+endif
+
 # We patch configure.ac
 ELFUTILS_AUTORECONF = YES
 
-- 
2.7.3
