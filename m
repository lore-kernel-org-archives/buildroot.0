From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Feb 2013 13:20:47 +0100
Subject: [Buildroot] [git commit] libgtk2: warn that directfb backend is
	deprecated
Message-ID: <20130228122205.3B6D89ADE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e0e42176d4a46515aff577d9702d91208e27c5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And will go away in the future, as discussed here:

http://lists.busybox.net/pipermail/buildroot/2013-February/067977.html

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgtk2/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 3e8cf75..88f4cc1 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -29,3 +29,6 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 
 comment "libgtk2 requires a toolchain with WCHAR and C++ support"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+
+comment "WARNING: Libgtk2 directfb backend is deprecated"
+	depends on BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_XORG7
