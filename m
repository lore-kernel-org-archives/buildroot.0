From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 22 Nov 2013 00:01:54 +0100
Subject: [Buildroot] [PATCH 1/1] schifra: fix install examples
Message-ID: <1385074914-10633-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

http://autobuild.buildroot.net/results/1ec/1ec3664f28492bf3da53dcbe8ceeb165bce8df6d/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/schifra/schifra.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index 4611e67..673c1a6 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -23,7 +23,7 @@ endef
 define SCHIFRA_INSTALL_EXAMPLES
 	cd $(@D) && for i in `find -type f -name 'schifra_*' -executable` ; \
 	do \
-		$(INSTALL) -m 0755 -D $$i (TARGET_DIR)/usr/bin/$$i; \
+		$(INSTALL) -m 0755 -D $$i $(TARGET_DIR)/usr/bin/$$i; \
 	done
 endef
 
-- 
1.8.1.4
