From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  6 Apr 2014 14:37:34 +0200
Subject: [Buildroot] [PATCH v2 2/2] util-linux: add missing dependency on
	libcap-ng
In-Reply-To: <1396787854-29725-1-git-send-email-romain.naour@openwide.fr>
References: <1396787854-29725-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1396787854-29725-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/util-linux/util-linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d661447..f0ae3ae 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -40,6 +40,10 @@ UTIL_LINUX_DEPENDENCIES += gettext
 UTIL_LINUX_MAKE_OPT += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+UTIL_LINUX_DEPENDENCIES += libcap-ng
+endif
+
 # Used by cramfs utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
-- 
1.9.0
