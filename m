From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 23:34:25 +0200
Subject: [Buildroot] [git commit] vlc: uclibc-ng can be used
Message-ID: <20150427213429.095C18190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af616e4fe0eb6e23af12e52b4cb8c1833c1bbc7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with X86 and ARM compiles.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index af96d08..b030a56 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -5,7 +5,7 @@ endif
 
 config BR2_PACKAGE_VLC
 	bool "vlc"
-	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
+	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -18,7 +18,7 @@ config BR2_PACKAGE_VLC
 
 	  http://www.videolan.org/vlc/
 
-comment "vlc needs a uclibc snapshot or (e)glibc toolchain w/ C++, wchar, threads, headers >= 3.7"
-	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) \
+comment "vlc needs a uclibc snapshot, uclibc-ng or (e)glibc toolchain w/ C++, wchar, threads, headers >= 3.7"
+	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
