From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 16:42:16 +0100
Subject: [Buildroot] [git commit] trinity: fix Config.in depends on logic
Message-ID: <20161030154220.1302A8076D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f1e0e688bba9b94287302258afdfacd6e6344e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment from trinity Config.in currently does not show up in
menuconfig for glibc or uClibc toolchains with older headers.
This commit fixes the logic so that it shows up when either one of the
dependencies from trinity are not met.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trinity/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index 35b54d8..0ce1f9a 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_TRINITY
 
 comment "trinity needs a uClibc or glibc toolchain w/ headers >= 3.4"
 	depends on BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_MUSL
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on BR2_TOOLCHAIN_USES_MUSL || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
