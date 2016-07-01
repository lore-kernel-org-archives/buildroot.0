From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:30 +0200
Subject: [Buildroot] [PATCH 30/31] package/systemd: Default yes for timesyncd
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-30-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems logical to enable a few options along with systemd when it's
the init system.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f91684e..5751918 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -310,6 +310,7 @@ config BR2_PACKAGE_SYSTEMD_TIMEDATED
 
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
 	bool "enable timesync daemon"
+	default y
 	help
 	  systemd-timesyncd is a service that may be used to synchronize the
 	  local system clock with a Network Time Protocol server.
-- 
2.8.1
