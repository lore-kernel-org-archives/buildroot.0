From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 22:01:08 +0200
Subject: [Buildroot] [git commit master] quagga: ripngd support needs ipv6
	support in toolchain
Message-ID: <20091003200149.76543776FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1be5730aa2bc51cbe1deca6282b22fa20306d47c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quagga/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index 4a4b175..e1a5c73 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_QUAGGA_RIPD
 
 config BR2_PACKAGE_QUAGGA_RIPNGD
 	bool "ripngd support"
+	depends on BR2_INET_IPV6
 	help
 	  Enable ripngd support in quagga.
 
-- 
1.6.3.3
