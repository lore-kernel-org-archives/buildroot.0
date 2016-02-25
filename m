From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:17 +0000
Subject: [Buildroot] [PATCH 08/32] package/systemd: remove networkd depends
	from timesyncd
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-9-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd-timesyncd can function without systemd-networkd.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 6edfba1..5d6759d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -98,7 +98,6 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	bool "enable SNTP client"
-	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
 	help
 	  systemd-timesyncd is a service that may be used to synchronize the
 	  local system clock with a Network Time Protocol Server.
-- 
1.9.1
