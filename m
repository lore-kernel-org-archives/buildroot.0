From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Jan 2015 17:39:05 +0100
Subject: [Buildroot] [PATCH 2/2] Revert "dhcpcd: blacklist Sourcery PowerPC
	toolchains"
In-Reply-To: <1420216745-24218-1-git-send-email-luca@lucaceresoli.net>
References: <1420216745-24218-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1420216745-24218-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit dfbfa6ef00ed32127bf01f5b4f525889921c3006
("dhcpcd: blacklist Sourcery PowerPC toolchains").

Blacklisting those toolchains is not useful anymore, since a patch for
dhcpcd 6.6.7 fixed the issue.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dhcpcd/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index f2ca099..ca0ad75 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_DHCPCD
 	bool "dhcpcd"
 	# No support for AI_ADDRCONFIG
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
-	# bad headers, no sa_family_t in linux/socket.h
-	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
 	help
 	  An RFC2131 compliant DHCP client
 
-- 
1.9.1
