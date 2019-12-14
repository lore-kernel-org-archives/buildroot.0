From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Dec 2019 12:38:16 +0100
Subject: [Buildroot] [PATCH 1/2] package/apitrace: needs host-python3
Message-ID: <20191214113817.1017079-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apitrace needs host-python3 since version 9.0 and
https://github.com/apitrace/apitrace/commit/78078e9025efa898f6e5402e306abdd205c7b2c0

Fixes:
 - http://autobuild.buildroot.org/results/5f27556ccc9daec578fe1bf2ed516ca9921ed474

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.24.0
