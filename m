From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:36 +0200
Subject: [Buildroot] [PATCH 25/30] package/matchbox-common: explicitly
	disable PDA folders when not selected
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <641cee0951bdc99ad2d26f6a13373ca9c6a3892e.1429725549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox-common/matchbox-common.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index da6bec7..038dd59 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -14,6 +14,8 @@ MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
 
 ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
 MATCHBOX_COMMON_CONF_OPTS += --enable-pda-folders
+else
+MATCHBOX_COMMON_CONF_OPTS += --disable-pda-folders
 endif
 
 $(eval $(autotools-package))
-- 
1.9.1
