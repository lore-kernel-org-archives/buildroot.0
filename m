From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Nov 2013 12:31:02 +0100
Subject: [Buildroot] [PATCH] dhcpcd: needs MMU
Message-ID: <1383391862-13252-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dhcpcd fails to build on non-MMU platforms:

  bind.o: In function `_daemonise':
  bind.c:(.text+0x62): undefined reference to `_fork'
  collect2: ld returned 1 exit status

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpcd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index dbde548..ddbc6f4 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DHCPCD
 	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	bool "dhcpcd"
 	help
 	  An RFC2131 compliant DHCP client
-- 
1.8.1.2
