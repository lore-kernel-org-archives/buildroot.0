From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Mar 2018 09:56:01 +0100
Subject: [Buildroot] [git commit] package/enlightenment: install to staging
Message-ID: <20180317085654.8D67883697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b71a4e2067996beb102aaef6af6f14356c95be8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

enlightenment provide enlightenment.pc and some shared libraries.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enlightenment/enlightenment.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index ae68888aac..ba6b54143e 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -26,6 +26,9 @@ ENLIGHTENMENT_MESON_OPTS += \
 	-Deldbus-codegen=$(HOST_DIR)/bin/eldbus-codegen \
 	-Dpam=false
 
+# enlightenment.pc and /usr/lib/enlightenment/modules/*.so
+ENLIGHTENMENT_INSTALL_STAGING = YES
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 ENLIGHTENMENT_MESON_OPTS += -Dsystemd=true
 ENLIGHTENMENT_DEPENDENCIES += systemd
