From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 10:52:20 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/davfs2: add
 davfs2 user and group
Message-ID: <20201109095111.49CE6834E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb56a4169e227c4309d56f95e35e7c5e7a13c00f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

mount.davfs expects the availability of the user and group davfs2.

Signed-off-by: Sven Klomp <mail@klomp.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2b98a6add92e38dbcd4ca9fda25454a38c719e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/davfs2/davfs2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 90f73f4df0..741baacc87 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -18,4 +18,8 @@ DAVFS2_CONF_ENV += \
 	ac_cv_path_NEON_CONFIG=$(STAGING_DIR)/usr/bin/neon-config \
 	LIBS=$(TARGET_NLS_LIBS)
 
+define DAVFS2_USERS
+        davfs2 -1 davfs2 -1 * - - - davfs user
+endef
+
 $(eval $(autotools-package))
