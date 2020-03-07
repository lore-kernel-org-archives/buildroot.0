From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:43:55 +0100
Subject: [Buildroot] [git commit] package/ruby: fix build on mips
Message-ID: <20200307213129.F03588FC93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7e56163a70969a7dcdb3adf57c363ac462867a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/d0ab5334f195a400a6d6dd6c49e3c1a2001b2b70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
