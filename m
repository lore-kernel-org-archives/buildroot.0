From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 15:14:02 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/exfat{,
 -utils}: fix installation path of the helper/utilities
Message-ID: <20191031140832.B079E8E233@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=429c9e5ad6cc6bb0d3b0f1aa70f49dbcb332fdfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

"mount" from the "util-linux" package does expect the helper utilities
in "/sbin" and not "/usr/sbin". We use "--exec-prefix=/" to fix the
issue. The man-pages are then still installed under "/usr/share/man".

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e7f32dc3c63668b37e338bae3b7a82efe247d793)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat-utils/exfat-utils.mk | 2 ++
 package/exfat/exfat.mk             | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index 62cd47186f..16d5aa03db 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -9,4 +9,6 @@ EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTI
 EXFAT_UTILS_LICENSE = GPL-3.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
 
+EXFAT_UTILS_CONF_OPTS += --exec-prefix=/
+
 $(eval $(autotools-package))
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index b52b197062..d8744feb9b 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -12,4 +12,6 @@ EXFAT_LICENSE = GPL-3.0+
 EXFAT_LICENSE_FILES = COPYING
 EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
+EXFAT_CONF_OPTS += --exec-prefix=/
+
 $(eval $(autotools-package))
