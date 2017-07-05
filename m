From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:36 +0200
Subject: [Buildroot] [PATCH v4 19/36] lesstif: remove host/usr reference
	from .mk comment
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-20-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While we're at it, correct it to $(HOST_DIR).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lesstif/lesstif.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
index 35d2c6d961..378c594e3b 100644
--- a/package/lesstif/lesstif.mk
+++ b/package/lesstif/lesstif.mk
@@ -31,7 +31,7 @@ define LESSTIF_NOMAN2HTML
 endef
 
 # Prevents to copy ac_find_motif.m4 on target, it would else
-# be created at $(TARGET_DIR)/$(TOPDIR)/output/host/usr/share/aclocal/ac_find_motif.m4
+# be created at $(TARGET_DIR)/$(HOST_DIR)/share/aclocal/ac_find_motif.m4
 define LESSTIF_FIXACLOCAL
 	sed -i -e "/install-data-am: install-aclocalDATA/d" $(@D)/scripts/autoconf/Makefile
 endef
-- 
2.13.2
