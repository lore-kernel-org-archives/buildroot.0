From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:41:51 +0100
Subject: [Buildroot] [git commit] package/apitrace: needs host-python3
Message-ID: <20191216213328.8317D8B7AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8328cc2539c2afd3a7bbb6f4663a9650d2cf5312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

apitrace needs host-python3 since version 9.0 and
https://github.com/apitrace/apitrace/commit/0b8b019952f2668a5e8786cc2d331062b958f02e

Fixes:
 - http://autobuild.buildroot.org/results/5f27556ccc9daec578fe1bf2ed516ca9921ed474

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apitrace/apitrace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index f9886d33c1..e6f8a2b1c5 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -9,7 +9,7 @@ APITRACE_SITE = $(call github,apitrace,apitrace,$(APITRACE_VERSION))
 APITRACE_LICENSE = MIT
 APITRACE_LICENSE_FILES = LICENSE
 
-APITRACE_DEPENDENCIES = host-python libpng
+APITRACE_DEPENDENCIES = host-python3 libpng
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 APITRACE_DEPENDENCIES += xlib_libX11
