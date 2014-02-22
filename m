From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 22:59:18 +0100
Subject: [Buildroot] [git commit] sawman: add autoreconf step
Message-ID: <20140222220153.9491C9B2FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a2850104bd1b3e9e7011e8dd7767eff158b835e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sawman needs the autoreconf step added in order for Vicente Olivert
Riera's patch - "sawman: Link using gcc instead of ld"
(8fc5ea004386431eaecfea51376fcc11c23c77c1) - to take effect.

Fixes:
  http://autobuild.buildroot.net/results/19b/19bfe0d39e457fd260b73928331721f57555fc84

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sawman/sawman.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
