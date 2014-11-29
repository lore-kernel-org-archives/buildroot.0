From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Nov 2014 19:56:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: disable on nios2
Message-ID: <1417287381-5045-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

minidlna triggers the _gp bug:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/77875/

"Fixes"
http://autobuild.buildroot.net/results/712/71230ee530a41b3611cd4526f0f010f9c2ef25eb/
http://autobuild.buildroot.net/results/79c/79cbae4dab3ad712bc20c752fdd91e168eade9fe/
http://autobuild.buildroot.net/results/df7/df7da91985a7bf2b05093bae7379ef22362a44fc/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 5c5306d..c0620d5 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_MINIDLNA
 	select BR2_PACKAGE_LIBJPEG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	# Triggers the _gp link issue
+	depends on !BR2_nios2
 	help
 	  MiniDLNA (aka ReadyDLNA) is server software with the aim of being
 	  fully compliant with DLNA/UPnP-AV clients.
-- 
1.7.10.4
