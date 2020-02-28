From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Feb 2020 09:44:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/ruby: fix build on mips
Message-ID: <20200228084435.3964164-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/d0ab5334f195a400a6d6dd6c49e3c1a2001b2b70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ruby/ruby.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 1899d14797..0ac1164332 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -48,6 +48,12 @@ endif
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 RUBY_DEPENDENCIES += berkeleydb
 endif
+ifeq ($(BR2_PACKAGE_LIBFFI),y)
+RUBY_DEPENDENCIES += libffi
+else
+# Disable fiddle to avoid a build failure with bundled-libffi on MIPS
+RUBY_CONF_OPTS += --with-out-ext=fiddle
+endif
 ifeq ($(BR2_PACKAGE_GDBM),y)
 RUBY_DEPENDENCIES += gdbm
 endif
-- 
2.25.0
