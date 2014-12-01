From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:20:06 +0100
Subject: [Buildroot] [git commit] iucode-tool: install init script
	unconditionally
Message-ID: <20141201233009.3254F80051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=febe876dcc18938b43fe1012b0acc689176188ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iucode-tool/iucode-tool.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

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
