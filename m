From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Jul 2012 14:52:23 +0200
Subject: [Buildroot] [git commit] lshw: fix build failure
Message-ID: <20120704125534.BD9C88EE7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=185646838f99cf515b379f937232a8f73c2e9931
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix space-unfriendly CC/CXX/AR argument passing.
Fixes build failure
http://autobuild.buildroot.net/results/d8c7b5ef4056a197bb8085b0fcdd09d931aec876/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lshw/lshw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 8b4fcc6..d0d97db 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -6,7 +6,7 @@
 
 LSHW_VERSION = B.02.16
 LSHW_SITE = http://ezix.org/software/files
-LSHW_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) AR=$(TARGET_AR) \
+LSHW_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
 	RPM_OPT_FLAGS="$(TARGET_CFLAGS)" all
 LSHW_MAKE_ENV = LIBS="$(if $(BR2_NEEDS_GETTEXT),-lintl)"
 LSHW_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT),libintl)
