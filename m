From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:43 +0200
Subject: [Buildroot] [PATCH 26/32 v2] package/matchbox-common: explicitly
	disable PDA folders when not selected
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <c894cbc6ffac7c0b1130b6468bbfe0810b1a1998.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox-common/matchbox-common.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/matchbox-common/matchbox-common.mk b/package/matchbox-common/matchbox-common.mk
index da6bec7..038dd59 100644
--- a/package/matchbox-common/matchbox-common.mk
+++ b/package/matchbox-common/matchbox-common.mk
@@ -14,6 +14,8 @@ MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
 
 ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
 MATCHBOX_COMMON_CONF_OPTS += --enable-pda-folders
+else
+MATCHBOX_COMMON_CONF_OPTS += --disable-pda-folders
 endif
 
 $(eval $(autotools-package))
-- 
1.9.1
