From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] cryptodev-linux: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
Message-ID: <20161022132039.AF1B980335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b7a1de720b0f6ec0d0c4c0e0e9fd34f4135e4b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptodev-linux/cryptodev-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index d23b647..e23e1e3 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -13,7 +13,7 @@ CRYPTODEV_LINUX_LICENSE_FILES = COPYING
 CRYPTODEV_LINUX_PROVIDES = cryptodev
 
 define CRYPTODEV_LINUX_MODULE_GEN_VERSION_H
-	$(MAKE) -C $(@D) version.h
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) version.h
 endef
 CRYPTODEV_LINUX_PRE_BUILD_HOOKS += CRYPTODEV_LINUX_MODULE_GEN_VERSION_H
 
