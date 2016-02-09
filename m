From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  9 Feb 2016 07:46:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/kbd: Fix broken Makefile when
	host-gettext was built before kbd
Message-ID: <1455000377-32030-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch uses the same solution used for util-linux:
https://git.busybox.net/buildroot/commit/package/util-linux?id=71f279f9a2bd3f086f3d31fa5a669d3f638bee99

To trigger the bug just build host-gettext before kbd.

Fixes
http://autobuild.buildroot.net/results/87e/87ea83ae4e7b7640651acd5031a624ca42e5b348/
http://autobuild.buildroot.net/results/532/532684b98e050cf5b4c50786bc9e8825eab21f97/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kbd/kbd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 8da153f..9dabce1 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -17,4 +17,6 @@ KBD_LICENSE = GPLv2+
 KBD_LICENSE_FILES = COPYING
 KBD_AUTORECONF = YES
 
+KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
+
 $(eval $(autotools-package))
-- 
2.7.0
