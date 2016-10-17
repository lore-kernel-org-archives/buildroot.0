From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:00 -0300
Subject: [Buildroot] [PATCH 13/93] jimtcl: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-14-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/jimtcl/jimtcl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index fe35223..1c1a6b8 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -51,7 +51,7 @@ endef
 define JIMTCL_BUILD_CMDS
 	SH_CFLAGS="-fPIC" \
 	SHOBJ_CFLAGS="-fPIC" \
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define JIMTCL_INSTALL_STAGING_CMDS
-- 
2.7.3
