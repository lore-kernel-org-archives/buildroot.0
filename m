From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  2 Jul 2016 15:59:10 +0200
Subject: [Buildroot] [PATCH 4/9] package/systemd: Default yes for timesyncd
In-Reply-To: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467467955-14609-4-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems logical to enable a few options along with systemd when it's
the init system.

Also change the help as timesyncd is a daemon that implements an SNTP client.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index b2f9feb..0e1e85d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -298,7 +298,8 @@ config BR2_PACKAGE_SYSTEMD_RESOLVED
 	  http://www.freedesktop.org/software/systemd/man/systemd-resolved.html
 
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
-	bool "enable SNTP client"
+	bool "enable timesync daemon"
+	default y
 	help
 	  systemd-timesyncd is a service that may be used to synchronize the
 	  local system clock with a Network Time Protocol server.
-- 
2.8.1
