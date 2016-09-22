From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 12:39:40 +0200
Subject: [Buildroot] [git commit] linux-tools: fix include path
Message-ID: <20160922104010.0C06081D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=affaea4b0516f28d5fce0b27fc2aba3b33b110c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The .mk files in linux-tools are named linux-tool-*.mk, not
linux-ext-*.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-tools/linux-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index d45f950..dada172 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -27,7 +27,7 @@ LINUX_TOOLS_INSTALL_STAGING = YES
 # However, since the files we include here are in the same directory as
 # the current Makefile, we are OK. But this is a hard requirement: files
 # included here *must* be in the same directory!
-include $(sort $(wildcard package/linux-tools/linux-ext-*.mk))
+include $(sort $(wildcard package/linux-tools/linux-tool-*.mk))
 
 LINUX_TOOLS_DEPENDENCIES += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
