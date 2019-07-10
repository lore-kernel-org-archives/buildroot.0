From: Victor Huesca <victor.huesca@bootlin.com>
Date: Wed, 10 Jul 2019 18:00:30 +0200
Subject: [Buildroot] [PATCH] package/openpgm: remove 'release-' prefix in
 order to sanitize version.
Message-ID: <20190710160030.27668-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While we would want to use the standard dot notation, his package is
already present on release-monitoring with dash separator so we have to
keep it with dashes in buildroot too -- at least until its release-
monitoring entry is updated (which we could do but it is used by other
distros and may break their compatibility).

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 package/openpgm/openpgm.hash | 2 +-
 package/openpgm/openpgm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openpgm/openpgm.hash b/package/openpgm/openpgm.hash
index f20e02a7fb..eee021a348 100644
--- a/package/openpgm/openpgm.hash
+++ b/package/openpgm/openpgm.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ecd48fd0bcfd8351ce6dcf31b063dd8fe83d3dab41bca62a6ebd6880a88c4a69  openpgm-release-5-2-122.tar.gz
+sha256 ecd48fd0bcfd8351ce6dcf31b063dd8fe83d3dab41bca62a6ebd6880a88c4a69  openpgm-5-2-122.tar.gz
diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index 8c85344b68..8163982d37 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENPGM_VERSION = release-5-2-122
-OPENPGM_SITE = $(call github,steve-o,openpgm,$(OPENPGM_VERSION))
+OPENPGM_VERSION = 5-2-122
+OPENPGM_SITE = $(call github,steve-o,openpgm,release-$(OPENPGM_VERSION))
 OPENPGM_LICENSE = LGPL-2.1+
 OPENPGM_LICENSE_FILES = openpgm/pgm/LICENSE
 OPENPGM_INSTALL_STAGING = YES
-- 
2.21.0
