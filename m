From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Apr 2012 11:17:02 -0300
Subject: [Buildroot] [PATCH 1/6] dhcp: needs MMU
Message-ID: <1333635427-24526-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcp/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index 2245839..38cf007 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_DHCP
 	bool "isc dhcp"
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
-- 
1.7.3.4
