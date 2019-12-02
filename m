From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2019 12:42:28 +0100
Subject: [Buildroot] [git commit] package/openpgm: drop release- prefix to
 match release-monitoring.org
Message-ID: <20191202114016.65FDA83907@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=071166c55839386f9f1a6553116efcb01f8c8e7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Autobuild has a "version bump" checker that sends message to a package
maintainer if its declared version does not match the latest one on
release-monitoring.org.  In case of openpgm the version _is_ the latest one,
but a mismatch is caused by including a "release-" prefix into tags on
upstream and excluding them on other websites when referring to the
package's version.

This also fixes sha256 value for the downloaded archive.

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openpgm/openpgm.hash | 2 +-
 package/openpgm/openpgm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openpgm/openpgm.hash b/package/openpgm/openpgm.hash
index f20e02a7fb..581a223462 100644
--- a/package/openpgm/openpgm.hash
+++ b/package/openpgm/openpgm.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ecd48fd0bcfd8351ce6dcf31b063dd8fe83d3dab41bca62a6ebd6880a88c4a69  openpgm-release-5-2-122.tar.gz
+sha256 acc1545fd8060aa66b17327110e2859e451cfc685ebd3b2211619728e3471b66  openpgm-5-2-122.tar.gz
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
