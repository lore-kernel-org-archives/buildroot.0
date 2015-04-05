From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Apr 2015 11:22:44 +0200
Subject: [Buildroot] [git commit] systemd: needs 3.10+ kernel headers
Message-ID: <20150405092340.638128191D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5749d9a695daeb3a1fd1b8afb3a45fb2e759a66a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f51/f510014600bc7d1e3cf81ff53268d186c8b417b8/
http://autobuild.buildroot.net/results/278/278a60a1569eb57773945281b102a0495ff32775/
http://autobuild.buildroot.net/results/083/083f9579893185d93c591d171b39d8e068b21412/
http://autobuild.buildroot.net/results/03a/03a96697aa72b69546d61e56d1285bb50b0633d9/

And many more.

Systemd needs NDA_PORT/VNI/IFINDEX from linux/neighbour.h, which were added
in 3.10 (6681712d: vxlan: generalize forwarding tables).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 3516056..935f7a1 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -95,12 +95,12 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd needs an (e)glibc toolchain, headers >= 3.7'
+comment 'systemd needs an (e)glibc toolchain, headers >= 3.10'
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
-		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7)
+		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
 
 config BR2_INIT_NONE
 	bool "None"
