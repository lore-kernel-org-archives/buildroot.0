From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:34 -0000
Subject: [Buildroot] [git commit branch/next] package/matchbox-common:
	explicitly disable PDA folders when not selected
Message-ID: <20150808105607.843EE7FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbe49afee21b8a4dd50caf107cdb3043e1f81085
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox-common/matchbox-common.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
