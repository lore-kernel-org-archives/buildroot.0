From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 19:16:14 +0100
Subject: [Buildroot] [git commit] package/xenomai: clean up wrappers cleanup
Message-ID: <20191219180847.8E3958D1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09340603c7d855e54006239d4c421d0d25214903
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no posix.wrappers anymore, but cobalt and modechk. Those only
play a role when building in combination with wrap-link.sh.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xenomai/xenomai.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 40f9b4af78..2577172e32 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -62,6 +62,9 @@ define XENOMAI_REMOVE_UNNEEDED_FILES
 	for i in xeno xeno-config xeno-info wrap-link.sh ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
+	for i in cobalt modechk ; do \
+		rm -f $(TARGET_DIR)/usr/lib/$$i.wrappers ; \
+	done
 	for i in autotune corectl hdb rtnet nomaccfg rtcfg rtifconfig \
 		rtiwconfig rtping rtroute tdmacfg rtps slackspot version; do \
 		rm -f $(TARGET_DIR)/usr/sbin/$$i ; \
@@ -121,9 +124,6 @@ XENOMAI_REMOVE_LIBS_LIST += $(if $(BR2_PACKAGE_XENOMAI_VRTX_SKIN),,vrtx)
 define XENOMAI_REMOVE_LIBS
 	for i in $(XENOMAI_REMOVE_LIBS_LIST) ; do \
 		rm -f $(TARGET_DIR)/usr/lib/lib$$i.* ; \
-		if [ $$i == "posix" ] ; then \
-			rm -f $(TARGET_DIR)/usr/lib/posix.wrappers ; \
-		fi ; \
 	done
 endef
 
