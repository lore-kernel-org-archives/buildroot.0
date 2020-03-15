From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 22:11:44 +0100
Subject: [Buildroot] [git commit] package/polkit: add linux-pam as a
 dependency if linux-pam is selected
Message-ID: <20200315205856.8BB9E8167C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35a0878aa934c4c92a854c3dc90f21ca896fd3e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without linux-pam built first, polkit will throw a configuration error:
configure: error: Could not find pam/pam-devel, please install the needed packages.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/polkit/polkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index bc9e3580ab..efd788a05c 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -24,6 +24,7 @@ POLKIT_CONF_OPTS = \
 	--disable-libsystemd-login
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+POLKIT_DEPENDENCIES += linux-pam
 POLKIT_CONF_OPTS += --with-authfw=pam
 else
 POLKIT_CONF_OPTS += --with-authfw=shadow
