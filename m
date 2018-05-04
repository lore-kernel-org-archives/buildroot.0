From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 May 2018 20:43:55 +0200
Subject: [Buildroot] [PATCH 1/1] libkrb5: add dependency on host-bison
Message-ID: <20180504184355.6586-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libkrb5 needs yacc

Fixes:
 - http://autobuild.buildroot.net/results/0bd0011978ecf0958ad459ae1aace564f4dde870

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/libkrb5.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 0390507304..0b4ba6be65 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -10,6 +10,7 @@ LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
 LIBKRB5_LICENSE = MIT
 LIBKRB5_LICENSE_FILES = NOTICE
+LIBKRB5_DEPENDENCIES = host-bison
 LIBKRB5_INSTALL_STAGING = YES
 
 # The configure script uses AC_TRY_RUN tests to check for those values,
-- 
2.14.1
