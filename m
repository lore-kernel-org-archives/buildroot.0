From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:05:21 +0200
Subject: [Buildroot] [git commit] libmbim: inherit BR2_USE_MMU dependency
	from libglib2
Message-ID: <20170906195816.4DCC981DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c9ffcae1075524ff587d00ee1597a1a415db019
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The USE_MMU dependency was missing from the chain of dependencies.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmbim/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
index 4f80592..5db8efb 100644
--- a/package/libmbim/Config.in
+++ b/package/libmbim/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBMBIM
 	bool "libmbim"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBGLIB2
@@ -13,5 +14,6 @@ config BR2_PACKAGE_LIBMBIM
 	  http://www.freedesktop.org/wiki/Software/libmbim/
 
 comment "libmbim needs udev /dev management and a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_UDEV
