From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 16:01:44 +0200
Subject: [Buildroot] [PATCH 8/9 v5] package/apparmor: enable PAM integration
In-Reply-To: <cover.1585490494.git.yann.morin.1998@free.fr>
References: <cover.1585490494.git.yann.morin.1998@free.fr>
Message-ID: <6ffc5e6035617755d9a0db1d68448e9280b749e6.1585490494.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr: split off to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apparmor/apparmor.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 26a09d2ff5..8a25cd4466 100644
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
-- 
2.20.1
