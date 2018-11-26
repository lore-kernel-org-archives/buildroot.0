From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 26 Nov 2018 19:22:47 +0100
Subject: [Buildroot] [PATCH 1/2] dante: add AUTORECONF=YES
Message-ID: <20181126182248.24817-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're patching compiler.m4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dante/dante.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index a147aa36dc..ff42e7432b 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -9,8 +9,8 @@ DANTE_SITE = http://www.inet.no/dante/files
 DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
 
-# Dante uses a *VERY* old configure.ac
-DANTE_LIBTOOL_PATCH = NO
+# We're patching compiler.m4
+DANTE_AUTORECONF = YES
 
 DANTE_CONF_OPTS += --disable-client --disable-preload --without-pam
 
-- 
2.14.1
