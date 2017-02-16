From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Feb 2017 15:14:13 +0200
Subject: [Buildroot] [PATCH] Revert "package/iptables: nfsynproxy not
	available on musl"
Message-ID: <e55813c866d7c063a694ed54240c65ff73c87ae0.1487250853.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 497f15b301273cd81e54b4fcc5da6ab90e27796c.

As the comment says, musl version 1.1.13 contains commit 53f41fb568ae4.
Buildroot now ships musl version 1.1.16, so enable build with musl.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iptables/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index cdcd1c2893dd..e6b12603e028 100644
--- a/package/iptables/Config.in
+++ b/package/iptables/Config.in
@@ -9,10 +9,6 @@ if BR2_PACKAGE_IPTABLES
 
 config BR2_PACKAGE_IPTABLES_BPF_NFSYNPROXY
 	bool "bpfc and nfsynproxy"
-	# this dependency can be removed when using a musl version
-	# containing this commit:
-	# http://git.musl-libc.org/cgit/musl/commit/?id=53f41fb568ae43034c9876cc9bd3961fd6d13671
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  Build bpf compiler and nfsynproxy configuration tool.
-- 
2.11.0
