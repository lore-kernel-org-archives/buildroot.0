From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:17:06 +0100
Subject: [Buildroot] [git commit branch/next] package/lz4: only use PREFIX
	for host installation
Message-ID: <20160229221805.1206F800E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8cca4c192e1890b2f1fbe422d8b63e405b46f67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As noted by Peter Korsgaard, using DESTDIR=$(HOST_DIR) and PREFIX=/usr
for the host installation is useless and actually incorrect (the
pkg-config file contains incorrect paths). Instead, using
PREFIX=$(HOST_DIR)/usr is simpler, and actually correct.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lz4/lz4.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 576b2a2..d2b09bb 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -22,8 +22,8 @@ define HOST_LZ4_BUILD_CMDS
 endef
 
 define HOST_LZ4_INSTALL_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) \
-		PREFIX=/usr install -C $(@D)
+	$(MAKE) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr \
+		install -C $(@D)
 endef
 
 define LZ4_BUILD_CMDS
