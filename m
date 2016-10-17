From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:07:20 -0300
Subject: [Buildroot] [PATCH 93/93] cryptodev-linux: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-94-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
 
-- 
2.7.3
