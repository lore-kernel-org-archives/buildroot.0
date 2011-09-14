From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 14 Sep 2011 02:05:17 +0200
Subject: [Buildroot] [PATCH] package/ncurses: disable use of the GPM library
In-Reply-To: <1315958717-9861-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1315958717-9861-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1315958717-9861-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building the host-ncurses, we don't really need to link against the GPM
library, as only the tic program is of any interest to us. Disable that when
configuring the host-ncurses.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/ncurses/ncurses.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index ac4c12b..50e85e8 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -131,7 +131,8 @@ define HOST_NCURSES_BUILD_CMDS
 endef
 
 HOST_NCURSES_CONF_OPT = \
-	--without-shared
+	--without-shared	\
+	--without-gpm
 
 $(eval $(call AUTOTARGETS,package,ncurses))
 $(eval $(call AUTOTARGETS,package,ncurses,host))
-- 
1.7.2.5
