From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 12:53:29 +0100
Subject: [Buildroot] [git commit] package: don't hide webservers when
	!BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
Message-ID: <20121103161144.DEC5799A31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22a6be4d43c9318cb21c8f351ef3c1132400008c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The busybox web server isn't providing the same binary name / cmdline
arguments as the "big" webservers, so they aren't equivalent.

As discussed on the dev day, don't hide them when _SHOW_OTHERS isn't
enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a4f75c9..c895e7a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -543,9 +543,7 @@ source "package/argus/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
 source "package/bluez_utils/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/boa/Config.in"
-endif
 source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
@@ -563,9 +561,7 @@ source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
 source "package/heirloom-mailx/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hiawatha/Config.in"
-endif
 source "package/hostapd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/ifplugd/Config.in"
@@ -579,9 +575,7 @@ source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lighttpd/Config.in"
-endif
 source "package/links/Config.in"
 source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
@@ -635,9 +629,9 @@ source "package/tcpdump/Config.in"
 source "package/tcpreplay/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tftpd/Config.in"
+endif
 source "package/thttpd/Config.in"
 source "package/tinyhttpd/Config.in"
-endif
 source "package/tn5250/Config.in"
 source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
