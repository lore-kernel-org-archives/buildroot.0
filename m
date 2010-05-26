From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] mtd-utils: recv_image needs IPv6
	support in toolchain
Message-ID: <20100526122003.8025F1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d3f8ad14b5b4655dc258c3e7440cc14173350d01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 0ba71d3..692654c 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -79,8 +79,12 @@ config BR2_PACKAGE_MTD_NFTL_FORMAT
 	bool "nftl_format"
 
 config BR2_PACKAGE_MTD_RECV_IMAGE
+	depends on BR2_INET_IPV6
 	bool "recv_image"
 
+comment "recv_image requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
+
 config BR2_PACKAGE_MTD_RFDDUMP
 	bool "rfddump"
 
-- 
1.6.3.3
