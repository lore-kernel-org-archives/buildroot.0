From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 16:25:18 +0100
Subject: [Buildroot] [git commit] kodi: Without native RPC use libtirpc
Message-ID: <20151004152539.13161818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a74623d5600cf582468125dfa9b9a78d20323d0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
v2 -> v3:
   - Remove the select (not needed, we only have to propagate the
     depends on)
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 797f59d..eede243 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -181,13 +181,14 @@ config BR2_PACKAGE_KODI_LIBMICROHTTPD
 
 config BR2_PACKAGE_KODI_LIBNFS
 	bool "nfs"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# libnfs -> libtirpc
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBNFS
 	help
 	  Enable NFS server support.
 
-comment "nfs support needs a toolchain w/ RPC support"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+comment "nfs support needs a toolchain w/ threads support"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
 config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "rtmp"
