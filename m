From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue,  6 Oct 2009 20:26:07 +0200
Subject: [Buildroot] [PATCH 5/6] mark odd strip invocations
In-Reply-To: <582a63d745311a980a8700a2a0ec17c3ae0f5ca9.1254853146.git.rep.dot.nop@gmail.com>
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
	<582a63d745311a980a8700a2a0ec17c3ae0f5ca9.1254853146.git.rep.dot.nop@gmail.com>
Message-ID: <5959e530273437a31071499009cecc7a7e9ab461.1254853146.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 package/ntfs-3g/ntfs-3g.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index efe15fa..c6894e4 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -20,8 +20,10 @@ $(NTFS_3G_TARGET_INSTALL_TARGET): $(NTFS_3G_TARGET_INSTALL_STAGING)
 
 ifeq ($(BR2_ENABLE_DEBUG),)
 $(NTFS_3G_HOOK_POST_INSTALL): $(NTFS_3G_TARGET_INSTALL_TARGET)
+	# huh?
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/bin/ntfs-3g
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/bin/ntfs-3g.probe
+	# huhu? STRIP_STRIP_UNNEEDED
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/lib/libntfs-3g.so*
 	touch $@
 endif
-- 
1.6.3.3
