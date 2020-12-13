From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Dec 2020 23:03:29 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/libllcp: drop wrong comment
Message-ID: <20201213220329.735998-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dependency on threads comes from libllcp itself not from libusb (which
is not even selected)

While at it, also add a comment about this dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add a comment

 package/libllcp/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libllcp/Config.in b/package/libllcp/Config.in
index 1660e92a87..5dc5c36a67 100644
--- a/package/libllcp/Config.in
+++ b/package/libllcp/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_LIBLLCP
 	bool "libllcp"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library extending libnfc with support for Logical Link Control
 	  Protocol.
 
 	  https://github.com/nfc-tools/libllcp
+
+comment "libllcp needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.29.2
