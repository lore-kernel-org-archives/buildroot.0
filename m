From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:45:34 +0200
Subject: [Buildroot] [git commit] package/systemd: Default yes for timesyncd
Message-ID: <20160702144557.744307FE2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83cd5731c956ece6c03e64685d2c11e06e5bf4b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems logical to enable a few options along with systemd when it's
the init system.

Also change the help as timesyncd is a daemon that implements an SNTP client.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index fcf8853..8ccd46e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -299,7 +299,8 @@ config BR2_PACKAGE_SYSTEMD_RESOLVED
 	  http://www.freedesktop.org/software/systemd/man/systemd-resolved.html
 
 config BR2_PACKAGE_SYSTEMD_TIMESYNCD
-	bool "enable SNTP client"
+	bool "enable timesync daemon"
+	default y
 	help
 	  systemd-timesyncd is a service that may be used to synchronize the
 	  local system clock with a Network Time Protocol server.
