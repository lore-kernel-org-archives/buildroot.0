From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:24 -0300
Subject: [Buildroot] [PATCH 17/51] tcping: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-18-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/tcping/tcping.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
index ff43490..4633b98 100644
--- a/package/tcping/tcping.mk
+++ b/package/tcping/tcping.mk
@@ -10,7 +10,7 @@ TCPING_LICENSE = GPLv3+
 TCPING_LICENSE_FILES = LICENSE
 
 define TCPING_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		-C $(@D) tcping.linux
 endef
 
-- 
2.7.3
