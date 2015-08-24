From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2015 17:13:37 +0200
Subject: [Buildroot] [git commit] tftpd: fix init script
Message-ID: <20150824151649.2453E7FD1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eaddabf55719a13f19bfadd5519e9b9a85cf95ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The daemon binary is tftpd, not in.tftpd. While we are at it, drop the
unneeded /usr/local from the PATH.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tftpd/S80tftpd-hpa |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tftpd/S80tftpd-hpa b/package/tftpd/S80tftpd-hpa
index 41c28d1..08443a4 100755
--- a/package/tftpd/S80tftpd-hpa
+++ b/package/tftpd/S80tftpd-hpa
@@ -4,9 +4,9 @@ OPTIONS="-c -l -s /var/lib/tftpboot"
 
 set -e
 
-PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
 DESC="HPA's tftpd"
-NAME=in.tftpd
+NAME=tftpd
 DAEMON=/usr/sbin/$NAME
 PIDFILE=/var/run/$NAME.pid
 SCRIPTNAME=/etc/init.d/S80tftpd-hpa
