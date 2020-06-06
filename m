From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 21:57:02 +0200
Subject: [Buildroot] [git commit] package/syslog-ng: drop unused systemd file
Message-ID: <20200606195619.3BA8A81E05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a473a9f05bba3826e4c171268d672cfb8f8ea2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 54ea03ccd7d68bcf846a7cb8fa58b9fb3ac0b914 ("package/syslog-ng:
implement systemd enablement using DefaultInstance") replaced the lines
installing the syslog-ng at default file with printf lines creating a file
in a syslog-ng at .service.d/ directory on-the-fly.  Since then, nothing
uses the syslog-ng at default file, so let's delete it.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/syslog-ng/syslog-ng at default | 8 --------
 1 file changed, 8 deletions(-)

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
