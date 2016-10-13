From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:48 -0300
Subject: [Buildroot] [PATCH 41/51] pptp-linux: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-42-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/pptp-linux/pptp-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index d7edf6c..1538457 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -12,7 +12,7 @@ PPTP_LINUX_LICENSE = GPLv2+
 PPTP_LINUX_LICENSE_FILES = COPYING
 
 define PPTP_LINUX_BUILD_CMDS
-	$(MAKE) -C $(@D) OPTIMIZE= DEBUG= \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) OPTIMIZE= DEBUG= \
 		CC="$(TARGET_CC)" \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
-- 
2.7.3
