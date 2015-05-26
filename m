From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:41:59 +0200
Subject: [Buildroot] [PATCH 04/21 RFC] core: remove .br-external on distclean
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <e4fb8dfb6d0298d6109747c46960ce286c78b0b4.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

distclean is supposed to return the current directory, whether in-tree
or out-of-tree, into pristine conditions, which means we should also
forget about any br2-external tree on distclean.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0038d11..9901ec5 100644
--- a/Makefile
+++ b/Makefile
@@ -814,7 +814,7 @@ ifeq ($(O),output)
 	rm -rf $(O)
 endif
 	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
-		$(CONFIG_DIR)/.auto.deps
+		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE)
 
 help:
 	@echo 'Cleaning:'
-- 
1.9.1
