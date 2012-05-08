From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 May 2012 00:23:42 +0200
Subject: [Buildroot] [git commit] cifs-utils: security bump to version 5.4
Message-ID: <20120508223206.0918996C78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18bd541dd02b153427fb4f010a6426c8e91bef1b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2012-1586.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cifs-utils/cifs-utils.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 52ad5ce..0fdb689 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -1,5 +1,11 @@
-CIFS_UTILS_VERSION = 5.1
+CIFS_UTILS_VERSION = 5.4
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = ftp://ftp.samba.org/pub/linux-cifs/cifs-utils/
 
+define CIFS_UTILS_NO_WERROR
+	$(SED) 's/-Werror//' $(@D)/Makefile.in
+endef
+
+CIFS_UTILS_POST_PATCH_HOOKS += CIFS_UTILS_NO_WERROR
+
 $(eval $(call AUTOTARGETS))
