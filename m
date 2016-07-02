From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:45:34 +0200
Subject: [Buildroot] [git commit] package/systemd: Default yes for networkd
Message-ID: <20160702144559.BB80E807A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30c3a035ff798e56c41e6967abbd11ee002fb212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems logical to enable a few options along with systemd when it's
the init system.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 8ccd46e..34c00ad 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -277,6 +277,7 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
+	default y
 	help
 	  systemd-networkd is a system service that manages networks.
 	  It detects and configures network devices as they appear, as well as
