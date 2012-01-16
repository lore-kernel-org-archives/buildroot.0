From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 16 Jan 2012 14:58:37 +0100
Subject: [Buildroot] [PATCH resend 03/22] cramfs: removed redundant
	HOST_FOO_DEPENDENCIES
In-Reply-To: <1326722336-11759-1-git-send-email-arnout@mind.be>
References: <1326722336-11759-1-git-send-email-arnout@mind.be>
Message-ID: <1326722336-11759-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cramfs/cramfs.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 4a0ec1c..57dbe40 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -9,7 +9,6 @@ CRAMFS_SOURCE=cramfs-$(CRAMFS_VERSION).tar.gz
 CRAMFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/cramfs
 
 CRAMFS_DEPENDENCIES = zlib
-HOST_CRAMFS_DEPENDENCIES = host-zlib
 
 define CRAMFS_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
-- 
1.7.8.3
