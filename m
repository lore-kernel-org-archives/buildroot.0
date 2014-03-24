From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Mar 2014 14:38:11 +0000
Subject: [Buildroot] [PATCH] cifs-utils: fix building on static
Message-ID: <1395671891-64769-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable position independent executables when building on static.

Fixes:
   http://autobuild.buildroot.net/results/bb0/bb00db98477f0f81c95ac1830ef3649b30963416/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/cifs-utils/cifs-utils.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 409ea53..3f4c71a 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -10,6 +10,10 @@ CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPLv3+
 CIFS_UTILS_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+CIFS_UTILS_CONF_OPT += --disable-pie
+endif
+
 define CIFS_UTILS_NO_WERROR
 	$(SED) 's/-Werror//' $(@D)/Makefile.in
 endef
-- 
1.7.1
