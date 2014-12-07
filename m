From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:00:26 +0100
Subject: [Buildroot] [git commit] package/minidlna: disable broken
	toolchains on nios2
Message-ID: <20141207210032.212D08012C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b5f4ae6888bafdfd73bf5afddf71dbfab9ac473
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

minidlna triggers the _gp bug:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/77875/

Fixes
http://autobuild.buildroot.net/results/712/71230ee530a41b3611cd4526f0f010f9c2ef25eb/
http://autobuild.buildroot.net/results/79c/79cbae4dab3ad712bc20c752fdd91e168eade9fe/
http://autobuild.buildroot.net/results/df7/df7da91985a7bf2b05093bae7379ef22362a44fc/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minidlna/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 5c5306d..f6faeee 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -14,6 +14,9 @@ config BR2_PACKAGE_MINIDLNA
 	select BR2_PACKAGE_LIBJPEG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	# Triggers the _gp link issue in nios2
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	help
 	  MiniDLNA (aka ReadyDLNA) is server software with the aim of being
 	  fully compliant with DLNA/UPnP-AV clients.
