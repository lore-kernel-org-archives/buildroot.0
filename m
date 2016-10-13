From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:18 -0300
Subject: [Buildroot] [PATCH 11/51] hans: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-12-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
