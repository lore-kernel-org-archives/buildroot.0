From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 09:55:48 +0200
Subject: [Buildroot] [git commit] package/apparmor: enable PAM integration
Message-ID: <20200420075435.B533A8F448@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8a0fe4f3a376e846bdc9a24b7ba9ee61a88fd06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr: split off to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/apparmor/apparmor.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index b1a47c080c..db24a62c52 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -39,6 +39,11 @@ ifeq ($(BR2_PACKAGE_APPARMOR_PROFILES),y)
 APPARMOR_TOOLS += profiles
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+APPARMOR_DEPENDENCIES += linux-pam
+APPARMOR_TOOLS += changehat/pam_apparmor
+endif
+
 define APPARMOR_BUILD_CMDS
 	$(foreach tool,$(APPARMOR_TOOLS),\
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
