From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat,  6 Jun 2020 15:50:28 -0400
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: drop unused systemd file
Message-ID: <20200606195028.3222-1-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 54ea03ccd7d68bcf846a7cb8fa58b9fb3ac0b914 ("package/syslog-ng:
implement systemd enablement using DefaultInstance") replaced the lines
installing the syslog-ng at default file with printf lines creating a file
in a syslog-ng at .service.d/ directory on-the-fly.  Since then, nothing
uses the syslog-ng at default file, so let's delete it.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/syslog-ng/syslog-ng at default | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 package/syslog-ng/syslog-ng at default

diff --git a/package/syslog-ng/syslog-ng at default b/package/syslog-ng/syslog-ng at default
deleted file mode 100644
index 0fad00ebac..0000000000
--- a/package/syslog-ng/syslog-ng at default
+++ /dev/null
@@ -1,8 +0,0 @@
-#
-# /etc/default/syslog-ng at default
-#
-CONFIG_FILE=/etc/syslog-ng.conf
-PERSIST_FILE=/var/run/syslog-ng.persist
-CONTROL_FILE=/var/run/syslog-ng.ctl
-PID_FILE=/var/run/syslog-ng.pid
-OTHER_OPTIONS="--enable-core"
-- 
2.17.1
