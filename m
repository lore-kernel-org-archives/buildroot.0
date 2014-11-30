From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:43 +0100
Subject: [Buildroot] [PATCHv3 55/74] iucode-tool: install init script
	unconditionally
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-56-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iucode-tool/iucode-tool.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 3124c73..081b086 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -15,9 +15,8 @@ IUCODE_TOOL_LICENSE = GPLv2+
 IUCODE_TOOL_LICENSE_FILES = COPYING
 
 define IUCODE_TOOL_INSTALL_INIT_SYSV
-	[ -f $(TARGET_DIR)/etc/init.d/S00iucode-tool ] || \
-		$(INSTALL) -D -m 0755 package/iucode-tool/S00iucode-tool \
-			$(TARGET_DIR)/etc/init.d/S00iucode-tool
+	$(INSTALL) -D -m 0755 package/iucode-tool/S00iucode-tool \
+		$(TARGET_DIR)/etc/init.d/S00iucode-tool
 endef
 
 $(eval $(autotools-package))
-- 
2.1.0
