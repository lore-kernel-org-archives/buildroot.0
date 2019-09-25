From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 21:44:33 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/util-linux:
 create $(TARGET_DIR)/etc/pam.d if necessary
Message-ID: <20190925193943.4C44F8F507@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=658838df1dbac579567c5cceaf9e1f8c403b23f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Useful for test purposes when we want to install util-linux with a
custom TARGET_DIR, e.g.

    $ make util-linux-reinstall TARGET_DIR=/tmp/util-linux

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 40af3a6661f8d85fef60b6de603e78700f4f86e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index c176d364ce..96b72625e9 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -232,9 +232,9 @@ endif
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
 define UTIL_LINUX_INSTALL_PAMFILES
-	$(INSTALL) -m 0644 package/util-linux/su.pam \
+	$(INSTALL) -D -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su
-	$(INSTALL) -m 0644 package/util-linux/su.pam \
+	$(INSTALL) -D -m 0644 package/util-linux/su.pam \
 		$(TARGET_DIR)/etc/pam.d/su-l
 	$(UTIL_LINUX_SELINUX_PAMFILES_TWEAK)
 endef
