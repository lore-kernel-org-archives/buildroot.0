From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:50 -0300
Subject: [Buildroot] [PATCH 43/51] mtdev2tuio: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-44-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/mtdev2tuio/mtdev2tuio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
index 7b00221..d2e7040 100644
--- a/package/mtdev2tuio/mtdev2tuio.mk
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -13,7 +13,7 @@ MTDEV2TUIO_LICENSE_FILES = COPYING
 # mtdev2tuio Makefile misuses $(LD) as gcc, so we need to override LD
 # here. Liblo uses log(3), so we need to link with -lm
 define MTDEV2TUIO_BUILD_CMDS
-	$(MAKE) \
+	$(TARGET_MAKE_ENV) $(MAKE) \
 		$(TARGET_CONFIGURE_OPTS) \
 		LD="$(TARGET_CC)" \
 		LIBS="-lmtdev -llo -lm" \
-- 
2.7.3
