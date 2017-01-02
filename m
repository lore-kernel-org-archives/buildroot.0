From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon,  2 Jan 2017 11:42:58 -0300
Subject: [Buildroot] [PATCH] weston: fix DEPENDENCIES typo
Message-ID: <20170102144258.29339-1-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Fixes a build failure with the PPS patchset since libva isn't populated.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/weston/weston.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 89e16f1..3a02df0 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -109,7 +109,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBVA),y)
 WESTON_CONF_OPTS += --enable-vaapi-recorder
-WESTON_DEPENDENIES += libva
+WESTON_DEPENDENCIES += libva
 else
 WESTON_CONF_OPTS += --disable-vaapi-recorder
 endif
-- 
2.10.2
