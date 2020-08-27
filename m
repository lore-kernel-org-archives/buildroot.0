From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu, 27 Aug 2020 10:49:54 +0200
Subject: [Buildroot] [PATCH 1/1] add dependency on Linux headers >= 3.14
Message-ID: <20200827084954.15932-1-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Iptraf-ng is compatible with Linux 3.14 as the last
introduced various packet types like : PACKET_KERNEL and PACKET_USERSPACE[1].

[1] https://elixir.bootlin.com/linux/v3.14-rc1/source/include/uapi/linux/if_packet.h

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/iptraf-ng/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
index f240daf93d..18bd43add9 100644
--- a/package/iptraf-ng/Config.in
+++ b/package/iptraf-ng/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IPTRAF_NG
 	bool "iptraf-ng"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	select BR2_PACKAGE_NCURSES
 	help
 	  IPTraf-ng is a console-based network monitoring program for
@@ -10,3 +11,6 @@ config BR2_PACKAGE_IPTRAF_NG
 
 	  IPTraf-ng is a fork of original IPTraf v3.0.0
 	  (http://iptraf.seul.org).
+
+comment "iptraf-ng needs headers >= 3.14"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
-- 
2.11.0
