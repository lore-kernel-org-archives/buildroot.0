From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:00 +0200
Subject: [Buildroot] [PATCH 31/69] mpfr: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-32-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/mpfr/mpfr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 5c3a6ef54fef..cc1034c10324 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -11,6 +11,7 @@ MPFR_LICENSE = LGPLv3+
 MPFR_LICENSE_FILES = COPYING.LESSER
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
+HOST_MPFR_DEPENDENCIES = host-gmp
 MPFR_MAKE_OPTS = RANLIB=$(TARGET_RANLIB)
 
 $(eval $(autotools-package))
-- 
2.1.0
