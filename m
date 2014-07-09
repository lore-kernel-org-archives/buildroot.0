From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 15:43:36 +0200
Subject: [Buildroot] [git commit] cloop: drop unused target variant
Message-ID: <20140709134616.6BEDC9CF0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21a524be106f3a86278f3238762f11bed0453ec7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We only support cloop for the host (for fs/cloop), so drop the unused target
variant.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cloop/cloop.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index c36a2ad..caed3f4 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -22,5 +22,4 @@ define HOST_CLOOP_INSTALL_CMDS
 	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
 endef
 
-$(eval $(generic-package))
 $(eval $(host-generic-package))
