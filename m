From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:49:59 +0200
Subject: [Buildroot] [git commit] package/apcupsd: add missing Config.in
 comment about C++ dependency
Message-ID: <20200421063623.D4F258F6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e5bb9d8c2e2df33409d4888ffd5d81397514c51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apcupsd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/apcupsd/Config.in b/package/apcupsd/Config.in
index eabfb14842..2849736a1a 100644
--- a/package/apcupsd/Config.in
+++ b/package/apcupsd/Config.in
@@ -63,3 +63,7 @@ comment "usb support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 endif
+
+comment "apcupsd needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
