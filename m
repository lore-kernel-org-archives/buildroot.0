From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 16:16:13 +0100
Subject: [Buildroot] [git commit] network-manager: S45network-manager: don't
	use pidof -o option
Message-ID: <20141201104838.6C5A57FFFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a6d8bf5d8ed299f4457276ffa994b409cb0d9ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pidof -o option is only available in the Busybox applet if
CONFIG_FEATURE_PIDOF_OMIT is enabled, and it isn't really needed here as the
init script isn't called 'NetworkManager', so get rid of it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/S45network-manager |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/S45network-manager b/package/network-manager/S45network-manager
index 7880891..5f32398 100755
--- a/package/network-manager/S45network-manager
+++ b/package/network-manager/S45network-manager
@@ -8,7 +8,7 @@ NETWORKMANAGER_BIN=${sbindir}/NetworkManager
 
 [ -x $NETWORKMANAGER_BIN ] || exit 0
 
-PID=`pidof -o %PPID NetworkManager`
+PID=`pidof NetworkManager`
 case "$1" in
 	start)
 		echo -n "Starting NetworkManager ... "
