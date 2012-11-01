From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 01 Nov 2012 15:35:55 +0100
Subject: [Buildroot] [PATCH 3 4/9] util-linux: only needs gettext if locale
	is selected
In-Reply-To: <20121101143539.8550.70150.stgit@localhost>
References: <20121101143539.8550.70150.stgit@localhost>
Message-ID: <20121101143555.8550.69229.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Also add missing select in Config.in.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/util-linux/Config.in     |    1 +
 package/util-linux/util-linux.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 43a8444..88d08e7 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Various useful/essential Linux utilities.
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f6028f4..f15baa7 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -29,7 +29,7 @@ else
 UTIL_LINUX_CONF_OPT += --without-ncurses
 endif
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 UTIL_LINUX_DEPENDENCIES += gettext
 UTIL_LINUX_MAKE_OPT += LIBS=-lintl
 endif
