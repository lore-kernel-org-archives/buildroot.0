From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:22:47 +0200
Subject: [Buildroot] [git commit] ntp: fix undefined variable in error print
Message-ID: <20140821132318.009439D4E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b86a60d7aca39c38ddee82daec10b054c258d51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The variable "$SCRIPTNAME" is undefined; replace with "$0".

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/S49ntp |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
index 6f9ec75..5721f59 100755
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp
@@ -36,7 +36,7 @@ case "$1" in
 	sleep 1
 	$0 start
 	;;
-  *) echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2
+  *) echo "Usage: $0 {start|stop|restart|reload|force-reload}" >&2
 	exit 1
 	;;
 esac
