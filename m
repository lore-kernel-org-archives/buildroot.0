From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 13:00:56 +0200
Subject: [Buildroot] [git commit] package/chrony: fix systemd service
Message-ID: <20160715110247.D4EAD82231@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ce32aa271fd7e9e72bbef6119be038e834c677a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the systemd service, the binary is located at /usr/sbin not
/usr/bin.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/chrony/chrony.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/chrony/chrony.service b/package/chrony/chrony.service
index 6000fce..325b63c 100644
--- a/package/chrony/chrony.service
+++ b/package/chrony/chrony.service
@@ -4,7 +4,7 @@ After=syslog.target network.target
 Conflicts=systemd-timesyncd.service
 
 [Service]
-ExecStart=/usr/bin/chronyd -n
+ExecStart=/usr/sbin/chronyd -n
 Restart=always
 
 [Install]
