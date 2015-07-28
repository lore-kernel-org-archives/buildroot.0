From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:14:47 +0200
Subject: [Buildroot] [git commit branch/next] ltrace: bump to last version
Message-ID: <20150808105649.68C857FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d5f5141aa6f2a16b4b59ac157e825654c1ed4b59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

0002-Install-lib-types-conf.patch was upstreamed.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltrace/0002-Install-lib-types-conf.patch |   41 ----------------------
 package/ltrace/ltrace.mk                         |    2 +-
 2 files changed, 1 insertions(+), 42 deletions(-)

diff --git a/package/ltrace/0002-Install-lib-types-conf.patch b/package/ltrace/0002-Install-lib-types-conf.patch
deleted file mode 100644
index cc5f110..0000000
--- a/package/ltrace/0002-Install-lib-types-conf.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Install lib*-types.conf
-
-This patch was written by J??r??me Pouiller and has been already sent to
-upstream:
-
-http://lists.alioth.debian.org/pipermail/ltrace-devel/2015-June/001328.html
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-Install lib*-types.conf
-
-Files etc/libpthread.so-types.conf and etc/libc.so-types.conf was introduced in
-commit 5ba9e10 ("Split type definitions from the bundled configs into their own
-files"). However, they was not installed.
-
-So latrce failed with messages like :
-/usr/share/ltrace/libm.so.conf:333: error: unknown type around 'ldouble erfl(ldouble);
-
-This patch declare these configuration files.
-
-Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
----
- Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index f63fa09..394d91c 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -72,7 +72,8 @@ dist_man5_MANS = ltrace.conf.5
- dist_doc_DATA = COPYING CREDITS INSTALL README TODO
- 
- dist_pkgdata_DATA = etc/syscalls.conf etc/libc.so.conf	\
--	etc/libm.so.conf etc/libacl.so.conf etc/libpthread.so.conf
-+	etc/libm.so.conf etc/libacl.so.conf etc/libpthread.so.conf \
-+	etc/libpthread.so-types.conf etc/libc.so-types.conf
- 
- EXTRA_DIST = \
- 	debian/changelog \
--- 
-1.8.5.6
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 8a78a2a..73ae28e 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTRACE_VERSION = be0c6870e08a3be43b3a0d210fb8dc7614b1e82f
+LTRACE_VERSION = c22d359433b333937ee3d803450dc41998115685
 LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
 LTRACE_DEPENDENCIES = elfutils
 LTRACE_CONF_OPTS = --disable-werror
