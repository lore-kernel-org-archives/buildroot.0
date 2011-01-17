From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Mon, 17 Jan 2011 19:14:46 +0300
Subject: [Buildroot] [PATCH 2/2] dialog: Add wchar support
In-Reply-To: <1295280886-20910-1-git-send-email-serj.kalichev@gmail.com>
References: <1295280886-20910-1-git-send-email-serj.kalichev@gmail.com>
Message-ID: <1295280886-20910-2-git-send-email-serj.kalichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dialog can be build with wide char version of ncursesw. The
wide char support is depend on BR2_USE_WCHAR.
---
 package/dialog/dialog.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index e8f025f..d2d5862 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -6,10 +6,14 @@
 DIALOG_VERSION:=1.1-20100428
 DIALOG_SOURCE:=dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE:=ftp://invisible-island.net/dialog
-DIALOG_CONF_OPT = --with-ncurses
-DIALOG_CONF_ENV = ac_cv_path_NCURSES_CONFIG=true LIBS=-lncurses
 DIALOG_DEPENDENCIES = ncurses
 
+ifneq ($(BR2_USE_WCHAR),y)
+DIALOG_CONF_OPT = --with-ncurses
+else
+DIALOG_CONF_OPT = --with-ncursesw --enable-widec
+endif
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 DIALOG_DEPENDENCIES+=libiconv
 endif
-- 
1.7.3.5
