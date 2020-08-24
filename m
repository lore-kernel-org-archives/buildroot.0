From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 24 Aug 2020 13:40:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/openfpgaloader: drop udev from
 comment
Message-ID: <20200824114028.1309375-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5714f3f81fdd85640d627f9b43490c52419650ea forgot to remove udev
from comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openfpgaloader/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index 4324507727..cda20b4347 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_OPENFPGALOADER
 
 	  https://github.com/trabucayre/openFPGALoader/
 
-comment "openfpgaloader needs udev, a toolchain w/ threads, wchar, C++"
+comment "openfpgaloader needs a toolchain w/ threads, wchar, C++"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV
+		!BR2_INSTALL_LIBSTDCPP
-- 
2.28.0
