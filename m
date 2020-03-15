From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:31:14 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/ruby: fix build
 on mips
Message-ID: <20200315101838.09D9D7FEA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24c4333ea4c2dc769fdfda8f606b2d9b1a6b3fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/d0ab5334f195a400a6d6dd6c49e3c1a2001b2b70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c7e56163a70969a7dcdb3adf57c363ac462867a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
