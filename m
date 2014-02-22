From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 22 Feb 2014 22:29:40 +0100
Subject: [Buildroot] [PATCH 1/1] sawman: add autoreconf step
Message-ID: <1393104580-10965-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sawman needs the autoreconf step added in order for Vicente Olivert
Riera's patch - "sawman: Link using gcc instead of ld"
(8fc5ea004386431eaecfea51376fcc11c23c77c1) - to take effect.

Fixes:
  http://autobuild.buildroot.net/results/19b/19bfe0d39e457fd260b73928331721f57555fc84

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/sawman/sawman.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index d807bb4..00516ca 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -8,6 +8,7 @@ SAWMAN_VERSION = 1.6.3
 SAWMAN_SOURCE = SaWMan-$(SAWMAN_VERSION).tar.gz
 SAWMAN_SITE = http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
+SAWMAN_AUTORECONF = YES
 SAWMAN_DEPENDENCIES = directfb
 
 $(eval $(autotools-package))
-- 
1.8.3.2
