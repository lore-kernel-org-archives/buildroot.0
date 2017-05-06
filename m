From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 May 2017 10:52:05 +0200
Subject: [Buildroot] [git commit] package/miraclecast: drop legacy
	systemd-kdbus select
Message-ID: <20170506085525.E82D1825B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=552bebcff244db39fde578fd63b2c417e4c0aaec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This options was recently removed and made it to legacy (in 815f7137739)
but miraclecast still selects it.

miraclecast builds fine without it, it seems, so just drop the select
altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/miraclecast/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/miraclecast/Config.in b/package/miraclecast/Config.in
index 4c6a8aa..57bd57a 100644
--- a/package/miraclecast/Config.in
+++ b/package/miraclecast/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_MIRACLECAST
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_READLINE
-	select BR2_PACKAGE_SYSTEMD_KDBUS
 	help
 	  The MiracleCast project provides software to connect external
 	  monitors to your system via Wifi. It is compatible to the
