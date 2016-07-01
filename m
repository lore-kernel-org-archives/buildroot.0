From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:31 +0200
Subject: [Buildroot] [PATCH 31/31] package/systemd: Default yes for networkd
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-31-git-send-email-maxime.hadjinlian@gmail.com>
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
index 5751918..0d0148e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -219,6 +219,7 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
+	default y
 	help
 	  systemd-networkd is a system service that manages networks.
 	  It detects and configures network devices as they appear, as well as
-- 
2.8.1
