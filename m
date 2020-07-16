From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 16:53:28 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mtools: select
 BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY
Message-ID: <20200716150405.C7E99814ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57d052553d1a8221d9c01065e1e5f9b720290ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=12986

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ac4a61e0eac8b6b11389727595d35fd31ffb144e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mtools/Config.in b/package/mtools/Config.in
index 99a073ca83..43e14e2c0c 100644
--- a/package/mtools/Config.in
+++ b/package/mtools/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_MTOOLS
 	bool "mtools"
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	# runtime UTF conversion support
+	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Mtools is a collection of utilities to access MS-DOS disks
 	  from Unix without mounting them. It supports Win'95 style
