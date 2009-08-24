From: Will Newton <will.newton@gmail.com>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] enchant: Fix dependencies.
Message-ID: <20090824202956.2D1DC7774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=da282970915ff9e6c6320afc9f40e99e17589028
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enchant requires C++ support, libglib2 and pkg-config.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/enchant/Config.in  |    2 ++
 package/enchant/enchant.mk |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index 0771a47..e65d681 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_ENCHANT
 	bool "enchant"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Enchant is a spell-checking library that provides a consistent
 	  API across a number of spell-checking system backends.
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index d972465..63cd311 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -11,4 +11,6 @@ ENCHANT_INSTALL_STAGING = YES
 ENCHANT_INSTALL_TARGET = YES
 ENCHANT_LIBTOOL_PATCH = NO
 
+ENCHANT_DEPENDENCIES = libglib2 host-pkgconfig
+
 $(eval $(call AUTOTARGETS,package,enchant))
-- 
1.6.3.3
