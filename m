From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed,  6 Sep 2017 10:43:27 +0200
Subject: [Buildroot] [PATCH] libmbim: inherit BR2_USE_MMU dependency from
	libglib2
Message-ID: <20170906084327.22928-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The USE_MMU dependency was missing from the chain of dependencies.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/libmbim/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
index 4f8059264..5db8efbf9 100644
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
-- 
2.13.1
