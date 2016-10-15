From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:16:46 +0200
Subject: [Buildroot] [git commit] hans: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161015121835.21C9181F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e7f2e73e2c2a6c881ef2633e92ddb9a8b678f74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hans/hans.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hans/hans.mk b/package/hans/hans.mk
index bda091f..5111d46 100644
--- a/package/hans/hans.mk
+++ b/package/hans/hans.mk
@@ -10,7 +10,7 @@ HANS_LICENSE = GPLv3+
 HANS_LICENSE_FILES = LICENSE
 
 define HANS_BUILD_CMDS
-	$(MAKE) GCC="$(TARGET_CC)" GPP="$(TARGET_CXX)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) GCC="$(TARGET_CC)" GPP="$(TARGET_CXX)" -C $(@D)
 endef
 
 define HANS_INSTALL_TARGET_CMDS
