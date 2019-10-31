From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 22:46:02 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/minizip: select
 libiconv if needed
Message-ID: <20191031213933.A18A68E399@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60337ec34da6ba5a740cb3ff56e93b6285fdd2d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

iconv.h is always included by mz_os_posix.c so select
BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 19806dab035ec228c8642c98809c950ea757b461)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minizip/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index 5a0c52b3bb..e4d185d9d7 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MINIZIP
 	bool "minizip"
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Enables to extract files from a .zip archive file.
 	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
