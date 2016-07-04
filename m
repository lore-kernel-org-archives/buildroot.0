From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:07:35 +0200
Subject: [Buildroot] [git commit] nodejs: remove the menu ... endmenu
Message-ID: <20160704210754.8CAAF821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2e94b7f08b8c25d305e8bdab5d844655ffdd735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only menu was "Module Selection", even though it contained
options (like "NPM for target") which are not related to selecting
modules. This commit therefore removes the menu ... endmenu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 432792f..da9ca7f 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -46,8 +46,6 @@ config BR2_PACKAGE_NODEJS_VERSION_STRING
 	default "6.2.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.45"
 
-menu "Module Selection"
-
 config BR2_PACKAGE_NODEJS_NPM
 	bool "NPM for the target"
 	select BR2_PACKAGE_OPENSSL
@@ -102,6 +100,4 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
 	  'libcurl' here, to ensure that buildroot builds the libcurl package,
 	  and does so before building your node modules.
 
-endmenu
-
 endif
