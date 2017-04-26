From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:20:16 +0200
Subject: [Buildroot] [git commit] package/xenomai: fallback to http
Message-ID: <20170426072113.CD89580648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2af19b0143ab0b4412304b27e488fd084dd3de25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The https protocol return:
"ERROR 503: Service Temporarily Unavailable"

Fixes:
http://autobuild.buildroot.net/results/120/12034603c46c8bd69590c88bbfe85261460b699c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 4844fff..c1477d9 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -11,7 +11,7 @@ else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
 
-XENOMAI_SITE = https://xenomai.org/downloads/xenomai/stable
+XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPL-2.1+ (libraries), GPL-2.0+ (kernel), GFDL-1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
