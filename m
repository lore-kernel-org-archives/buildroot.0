From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:28 -0300
Subject: [Buildroot] [PATCH 21/51] iputils: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-22-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 0a89120..21f5dcb 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -62,7 +62,7 @@ IPUTILS_MAKE_OPTS += USE_CRYPTO=no
 endif
 
 define IPUTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(IPUTILS_MAKE_OPTS)
 endef
 
 define IPUTILS_INSTALL_TARGET_CMDS
-- 
2.7.3
