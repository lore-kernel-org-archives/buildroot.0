From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:49:55 +0100
Subject: [Buildroot] [git commit] package/systemd: remove networkd depends
	from timesyncd
Message-ID: <20160302202759.87D2480203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7afdc7043b097f41bcdee3954e9a32267b8256c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd-timesyncd can function without systemd-networkd.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ace385a..89427cc 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -98,7 +98,6 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	bool "enable SNTP client"
-	depends on BR2_PACKAGE_SYSTEMD_NETWORKD
 	help
 	  systemd-timesyncd is a service that may be used to synchronize the
 	  local system clock with a Network Time Protocol Server.
