From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 May 2010 22:53:39 +0200
Subject: [Buildroot] [git commit master] sshfs: needs largefile support
	(because of fuse)
Message-ID: <20100521205458.8700412EA9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=51861e1ba19a036625643a56382a175e8388529f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sshfs/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 7ddd0c1..fc820a3 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_OPENSSH
+	depends on BR2_LARGEFILE
 	help
 	  FUSE makes it possible to implement a filesystem in a userspace
 	  program. Features include: simple yet comprehensive API, secure
@@ -15,4 +16,4 @@ config BR2_PACKAGE_SSHFS
 	  http://fuse.sourceforge.net/sshfs.html
 
 comment "sshfs requires a toolchain with LARGEFILE support"
-        depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE
-- 
1.6.3.3
