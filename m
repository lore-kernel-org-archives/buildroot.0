From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:25:44 +0100
Subject: [Buildroot] [git commit] Revert "package/iptables: nfsynproxy not
	available on musl"
Message-ID: <20170301170423.6E55B7FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a27508ffb2c9d4821e5ec08c5f616a62b669001
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 497f15b301273cd81e54b4fcc5da6ab90e27796c.

As the comment says, musl version 1.1.13 contains commit 53f41fb568ae4.
Buildroot now ships musl version 1.1.16, so enable build with musl.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iptables/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/iptables/Config.in b/package/iptables/Config.in
index cdcd1c2..e6b1260 100644
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
