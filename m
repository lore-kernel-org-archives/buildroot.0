From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  5 May 2017 22:54:51 +0200
Subject: [Buildroot] [PATCH] package/miraclecast: drop legacy systemd-kdbus
	select
Message-ID: <20170505205451.4664-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This options was recently removed and made it to legacy (in 815f7137739)
but miraclecast still selects it.

miraclecast builds fine without it, it seems, so just drop the select
altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/miraclecast/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/miraclecast/Config.in b/package/miraclecast/Config.in
index 4c6a8aaa07..57bd57a97b 100644
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
-- 
2.11.0
