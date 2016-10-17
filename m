From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:28 -0300
Subject: [Buildroot] [PATCH 41/93] memstat: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-42-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/memstat/memstat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 7ee4d60..e11b4ae 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -11,7 +11,7 @@ MEMSTAT_LICENSE = GPL
 MEMSTAT_LICENSE_FILES = debian/copyright
 
 define MEMSTAT_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(@D) memstat
 endef
 
-- 
2.7.3
