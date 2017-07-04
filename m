From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:25 +0200
Subject: [Buildroot] [git commit] flex: use the new gettext logic
Message-ID: <20170704233514.DEE28802C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3675860e878e23d0762101ef1af40ac8159aa86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flex/Config.in | 1 -
 package/flex/flex.mk   | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/flex/Config.in b/package/flex/Config.in
index 76e8bc7..33d123d 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_FLEX
 	bool "flex"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A fast lexical analyser generator. A tool for generating
 	  programs that perform pattern-matching on text.
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 905621e..b782699 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -9,8 +9,7 @@ FLEX_SITE = https://github.com/westes/flex/files/981163
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
-FLEX_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT_IF_LOCALE),gettext) host-m4
+FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
 FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
 HOST_FLEX_DEPENDENCIES = host-m4
 
