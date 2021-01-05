From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 17:46:51 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libllcp: drop
 wrong comment
Message-ID: <20210105163029.8B08582A9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbdea2ed1ff7213421fb21469b31d52bb45dc9e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Dependency on threads comes from libllcp itself not from libusb (which
is not even selected)

While at it, also add a comment about this dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b9dc9709090e6ccaba20ce08c720ec3deda10091)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
