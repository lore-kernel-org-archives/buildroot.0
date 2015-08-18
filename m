From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:19:41 +0200
Subject: [Buildroot] [git commit] lightning: requires share library support
Message-ID: <20150818092000.2EAD5816A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a371869499e2834b79bd91bb68d6d61af0e8f020
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Uses -ldl unconditionally.

Fixes:
http://autobuild.buildroot.net/results/55d/55d30db7212863d9f898bb929f0c75d529036bad/
http://autobuild.buildroot.net/results/6c3/6c37a1cd353b7cac854cc85d29a8232233414c68/
http://autobuild.buildroot.net/results/459/459ab12bc3eeb493f39efa2450bc829a351ee3a3/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lightning/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index 8caf39f..6750114 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -1,7 +1,13 @@
+comment "lightning needs a toolchain w/ dynamic library"
+	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
+		BR2_mipsel || BR2_arm || BR2_powerpc
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LIGHTNING
 	bool "lightning"
 	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
 		BR2_mipsel || BR2_arm || BR2_powerpc
+	depends on !BR2_STATIC_LIBS
 	help
 	  GNU lightning is a library that generates
 	  assembly language code at run-time.
