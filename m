From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:14 -0300
Subject: [Buildroot] [PATCH 07/51] arptables: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-8-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/arptables/arptables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
index 4f101c7..888d396 100644
--- a/package/arptables/arptables.mk
+++ b/package/arptables/arptables.mk
@@ -10,7 +10,7 @@ ARPTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/arptables/arp
 ARPTABLES_LICENSE = GPLv2+
 
 define ARPTABLES_BUILD_CMDS
-	$(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		CC="$(TARGET_CC)" COPT_FLAGS="$(TARGET_CFLAGS)"
 endef
 
-- 
2.7.3
