From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:54:18 -0600
Subject: [Buildroot] [PATCH 26/30] util-linux: selinux, audit,
	and pam support
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-27-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/util-linux/util-linux.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index e06fa9a..b31afdc 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -51,6 +51,27 @@ ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 UTIL_LINUX_DEPENDENCIES += libcap-ng
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+UTIL_LINUX_DEPENDENCIES += libselinux
+UTIL_LINUX_CONF_OPTS += --with-selinux
+else
+UTIL_LINUX_CONF_OPTS += --without-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_PAM),y)
+UTIL_LINUX_DEPENDENCIES += pam
+UTIL_LINUX_CONF_OPTS += --with-pam
+else
+UTIL_LINUX_CONF_OPTS += --without-pam
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+UTIL_LINUX_DEPENDENCIES += audit
+UTIL_LINUX_CONF_OPTS += --with-audit
+else
+UTIL_LINUX_CONF_OPTS += --without-audit
+endif
+
 # Used by cramfs utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
-- 
1.9.1
