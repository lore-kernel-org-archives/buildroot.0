From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 11:17:22 +0100
Subject: [Buildroot] [git commit] lftp: needs fork(), requires MMU support
Message-ID: <20140302101759.67EC89B9D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5970e883419a55f25ea900d776287ae6ea34b62e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/321/321a6eedd2c79ce45c047cd8ebddb67124da092c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lftp/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lftp/Config.in b/package/lftp/Config.in
index f4bde79..6a65edf 100644
--- a/package/lftp/Config.in
+++ b/package/lftp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LFTP
 	bool "lftp"
 	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_OPENSSL
@@ -61,4 +62,5 @@ config BR2_PACKAGE_LFTP_PROTO_SFTP
 endif  # BR2_PACKAGE_LFTP
 
 comment "lftp requires a toolchain w/ C++, wchar"
+	depends on BR2_USE_MMU
 	depends on !(BR2_USE_WCHAR && BR2_INSTALL_LIBSTDCPP)
