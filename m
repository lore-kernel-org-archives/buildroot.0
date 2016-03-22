From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Mar 2016 18:38:00 -0300
Subject: [Buildroot] [PATCH 1/2] pcre: enable unicode properties for host
	variant
Message-ID: <1458682681-29918-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They're required for host-libglib2 and using system pcre is the
default/recommended with newer versions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pcre/pcre.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 06652c7..7fcc592 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -12,6 +12,9 @@ PCRE_LICENSE_FILES = LICENCE
 PCRE_INSTALL_STAGING = YES
 PCRE_CONFIG_SCRIPTS = pcre-config
 
+# They're required for host-libglib2
+HOST_PCRE_CONF_OPTS = --enable-unicode-properties
+
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # pcre will use the host g++ if a cross version isn't available
 PCRE_CONF_OPTS = --disable-cpp
-- 
2.7.3
