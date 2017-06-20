From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:13:15 +0200
Subject: [Buildroot] [git commit] aiccu: don't link with librt
Message-ID: <20170620201445.4E9C781E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=045eb96407e4d2f97df5fd3706d7e7a081b2555e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot no longer supports toolchains with glibc older than 2.17, so there
is no need to link with librt for clock_* system calls.

Cc: Michael Rommel <rommel@layer-7.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aiccu/0003-clock-suite-functions-fix.patch     | 18 ------------------
 ...f-ether-header.patch => 0003-if-ether-header.patch} |  0
 2 files changed, 18 deletions(-)

diff --git a/package/aiccu/0003-clock-suite-functions-fix.patch b/package/aiccu/0003-clock-suite-functions-fix.patch
deleted file mode 100644
index 365e72a..0000000
--- a/package/aiccu/0003-clock-suite-functions-fix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-aiccu: fix undefined reference to clock_* functions
-
-Since glibc 2.17 the clock_* suite functions are available directly in 
-the main C library. For previous versions we still need -lrt to link.
-
-Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
-
---- aiccu/unix-console/Makefile.orig	2014-01-14 10:17:20.204602513 +0000
-+++ aiccu/unix-console/Makefile	2014-01-14 10:17:31.435777359 +0000
-@@ -42,7 +42,7 @@ CFLAGS	+= -D AICCU_CONSOLE
- # Currently defaultly builds only on Linux, but other platforms might easily also support it
- ifeq ($(shell uname | grep -c "Linux"),1)
- CFLAGS	+= -D AICCU_GNUTLS
--LDFLAGS += -lgnutls
-+LDFLAGS += -lgnutls -lrt
- endif
- 
- # Linux
diff --git a/package/aiccu/0004-if-ether-header.patch b/package/aiccu/0003-if-ether-header.patch
similarity index 100%
rename from package/aiccu/0004-if-ether-header.patch
rename to package/aiccu/0003-if-ether-header.patch
