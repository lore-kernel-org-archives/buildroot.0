From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Oct 2014 11:14:23 +0200
Subject: [Buildroot] [git commit] connman: select dbus support in
	wpa_supplicant
Message-ID: <20141014074530.E818BB2CE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8645d43ac493760146a5a8d9bc82e812c931a4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... else connman cannot communicate with wpa_supplicant

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index a42de17..8803aeb 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
 config BR2_PACKAGE_CONNMAN_WIFI
 	bool "enable WiFi support"
 	select BR2_PACKAGE_WPA_SUPPLICANT # runtime
+	select BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW # runtime
 	help
 	  Enable WiFi support (scan and static/dhcp interface
 	  setup). ConnMan detects the start of wpa_supplicant
