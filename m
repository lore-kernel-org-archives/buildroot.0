From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 17:04:22 +0100
Subject: [Buildroot] [git commit] package/sysklogd: install syslogd to /sbin
 and logger to /usr/bin
Message-ID: <20210124154548.110AC815E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9707ca6dafe08a07e77782f5b53fe02f316df64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace --exec-prefix, which applies to both sbin and bin, with the more
granular --bindir for logger and --sbindir for syslogd.  This because
BusyBox installs its syslgod in /sbin and its logger in /usr/bin.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998 at free.fr: add comment, split one-option-per-line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysklogd/sysklogd.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 18d30400e1..e68526d24c 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -9,8 +9,12 @@ SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKL
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
 SYSKLOGD_CPE_ID_VALID = YES
+
+# Busybox install logger in /usr/bin, and syslogd in /sbin, so install in
+# the same locations so that busybox does not install its applets in there.
 SYSKLOGD_CONF_OPTS = \
-	--exec-prefix=/ \
+	--bindir=/usr/bin \
+	--sbindir=/sbin \
 	--with-suspend-time=$(BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY)
 
 # Disable/Enable utilities
