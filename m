From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 21:34:56 +0200
Subject: [Buildroot] [git commit] package/lshw: add missing dependency on
	gettext
Message-ID: <20120920195433.9509D996BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d5dbb936060d1912953c9f0423ecbc08c6a75f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lshw.mk defines a build-dependency on gettext,
but not in its Config.in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
CC: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lshw/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 4960ac9..98beacd 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LSHW
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  lshw (Hardware Lister) is a small tool to provide
 	  detailed information on the hardware configuration of the machine.
