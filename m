From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 Oct 2011 15:36:28 +0200
Subject: [Buildroot] [git commit] orc: add host support
Message-ID: <20111024133642.C02308EDF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5889480ec61ecba3e6abe0d9cb70c1b7507a6ee5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages use orc to generate C code at build time using orcc, so we
need to build orc for the host as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/orc/orc.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index d4ff3e2..97c80f2 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -6,6 +6,7 @@
 ORC_VERSION = 0.4.14
 ORC_SITE = http://code.entropywave.com/download/orc/
 ORC_INSTALL_STAGING = YES
+ORC_DEPENDENCIES = host-orc
 
 define ORC_REMOVE_BUGREPORT
 	rm -f $(TARGET_DIR)/usr/bin/orc-bugreport
@@ -22,3 +23,4 @@ ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_DEVFILES
 endif
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
