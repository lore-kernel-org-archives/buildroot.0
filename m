From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 13:56:10 -0700
Subject: [Buildroot] [PATCH 1/1] package/polkit: add linux-pam as a
 dependency if linux-pam is selected
Message-ID: <20200315205610.2227486-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Without linux-pam built first, polkit will throw a configuration error:
configure: error: Could not find pam/pam-devel, please install the needed packages.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
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
-- 
2.24.1
