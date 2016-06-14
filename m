From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:31:16 +0200
Subject: [Buildroot] [PATCH 08/12] package/cpio: allow generating host-cpio
In-Reply-To: <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465918277-30675-8-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to be sure to have a cpio binary on host which supports
--reproducible.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 package/cpio/cpio.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 1576127..87b3df8 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -18,3 +18,9 @@ CPIO_DEPENDENCIES += argp-standalone
 endif
 
 $(eval $(autotools-package))
+
+HOST_CPIO_DEPENDENCIES =
+
+$(eval $(host-autotools-package))
+
+CPIO_REPRODUCIBLE = $(HOST_DIR)/usr/bin/cpio --reproducible
-- 
2.8.2
