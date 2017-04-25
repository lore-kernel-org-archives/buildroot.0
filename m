From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 25 Apr 2017 23:26:12 +0200
Subject: [Buildroot] [PATCH] package/xenomai: fallback to http
Message-ID: <20170425212612.4612-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The https protocol return:
"ERROR 503: Service Temporarily Unavailable"

Fixes:
http://autobuild.buildroot.net/results/120/12034603c46c8bd69590c88bbfe85261460b699c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.9.3
