From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 23:56:38 +0100
Subject: [Buildroot] [git commit] package/libllcp: drop wrong comment
Message-ID: <20201230223904.9BDDA8356A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9dc9709090e6ccaba20ce08c720ec3deda10091
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dependency on threads comes from libllcp itself not from libusb (which
is not even selected)

While at it, also add a comment about this dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
