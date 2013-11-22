From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 11:40:39 +0100
Subject: [Buildroot] [git commit] schifra: fix install examples
Message-ID: <20131122145920.A86D89BD91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2b29f4fa94590e37f6c2047ad15306c9533d09b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

http://autobuild.buildroot.net/results/1ec/1ec3664f28492bf3da53dcbe8ceeb165bce8df6d/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/schifra/schifra.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
