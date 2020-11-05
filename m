From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Nov 2020 09:43:29 +0100
Subject: [Buildroot] [git commit branch/next] package/bind: bump to version
 9.11.24
Message-ID: <20201105083135.28D4882DC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9679d3f0218519ea7a01f3b5fefb7f6dd23b138e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Turn 0001-cross.patch into git patch.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/0001-cross.patch | 25 ++++++++++++++++++-------
 package/bind/bind.hash        |  6 +++---
 package/bind/bind.mk          |  2 +-
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/package/bind/0001-cross.patch b/package/bind/0001-cross.patch
index d3e7cc68a6..f39be2f837 100644
--- a/package/bind/0001-cross.patch
+++ b/package/bind/0001-cross.patch
@@ -1,15 +1,24 @@
-Use host compiler to build 'gen' since it's run when building.
+From 505cc9fcadda5607dc4c5bacb03928c0b35162a8 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 4 Nov 2020 17:51:38 +0100
+Subject: [PATCH] Use host compiler to build 'gen' since it's run when
+ building.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Fabrice: updated for 9.11.10]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ lib/dns/Makefile.in | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
 
-diff -Nura bind-9.5.1-P1/lib/dns/Makefile.in bind-9.5.1-P1.gencross/lib/dns/Makefile.in
---- bind-9.5.1-P1/lib/dns/Makefile.in	2007-09-11 22:09:08.000000000 -0300
-+++ bind-9.5.1-P1.gencross/lib/dns/Makefile.in	2009-03-04 16:35:23.000000000 -0200
-@@ -160,10 +160,8 @@
+diff --git a/lib/dns/Makefile.in b/lib/dns/Makefile.in
+index 8fc4e94f26..4ac92857e0 100644
+--- a/lib/dns/Makefile.in
++++ b/lib/dns/Makefile.in
+@@ -184,10 +184,8 @@ code.h:	gen
  	./gen -s ${srcdir} > code.h || { rm -f $@ ; exit 1; }
-
+ 
  gen: gen.c
 -	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
 -	${LFS_CFLAGS} ${LFS_LDFLAGS} \
@@ -17,7 +26,9 @@ diff -Nura bind-9.5.1-P1/lib/dns/Makefile.in bind-9.5.1-P1.gencross/lib/dns/Make
 -	${BUILD_LIBS} ${LFS_LIBS}
 +	${HOSTCC} ${HOST_CFLAGS} -I${top_srcdir}/lib/isc/include \
 +	${HOST_LDFLAGS} -o $@ ${srcdir}/gen.c
-
+ 
  timestamp: include libdns. at A@
  	touch timestamp
+-- 
+2.29.1
 
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 4ba0182b1c..e02c06ff3e 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.22/bind-9.11.22.tar.gz.asc
-# with key AE3FAC796711EC59FC007AA474BB6B9A4CBB3D38
-sha256  afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9  bind-9.11.22.tar.gz
+# Verified from https://ftp.isc.org/isc/bind9/9.11.24/bind-9.11.24.tar.gz.asc
+# with key 95CEDA256B1CA0A15F302FB59521A7ED5DACE918
+sha256  f261587c5d37c7f14e8393547c4556faefa701a646930f1b6408d71519a30428  bind-9.11.24.tar.gz
 sha256  da2aec2b7f6f0feb16bcb080e2c587375fd3195145f047e4d92d112f5b9db501  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 18fc4845f9..ba60c111ef 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.22
+BIND_VERSION = 9.11.24
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
