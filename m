From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 09:55:48 +0200
Subject: [Buildroot] [git commit] package/apparmor: enable apache integration
Message-ID: <20200420075435.BD7858EA89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adc2376bbb28c5a100e6adc51dee113fc38e015b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr: split off to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/apparmor/apparmor.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index db24a62c52..311a79799f 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -44,6 +44,12 @@ APPARMOR_DEPENDENCIES += linux-pam
 APPARMOR_TOOLS += changehat/pam_apparmor
 endif
 
+ifeq ($(BR2_PACKAGE_APACHE),y)
+APPARMOR_DEPENDENCIES += apache
+APPARMOR_TOOLS += changehat/mod_apparmor
+APPARMOR_MAKE_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
+endif
+
 define APPARMOR_BUILD_CMDS
 	$(foreach tool,$(APPARMOR_TOOLS),\
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
