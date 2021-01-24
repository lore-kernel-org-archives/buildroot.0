From: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 24 Jan 2021 16:34:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: install syslogd to /sbin
 and logger to /usr/bin
Message-ID: <20210124153409.4041717-1-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace --exec-prefix, which applies to both sbin and bin, with the more
granular --bindir for logger and --sbindir for syslogd.  This because
BusyBox installs its syslgod in /sbin and its logger in /usr/bin.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 18d30400e1..de5ae17227 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -10,7 +10,7 @@ SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
 SYSKLOGD_CPE_ID_VALID = YES
 SYSKLOGD_CONF_OPTS = \
-	--exec-prefix=/ \
+	--bindir=/usr/bin --sbindir=/sbin \
 	--with-suspend-time=$(BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY)
 
 # Disable/Enable utilities
-- 
2.25.1
