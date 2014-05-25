From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 21:12:41 +0200
Subject: [Buildroot] [git commit] lesstif: needs MMU
Message-ID: <20140525204125.818D99CDAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b4a795f072bea6871562ad1c12f1eb94288e298
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9f7/9f718c9c9907d9aa2a7a0c45c872f5a8f34b8399/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lesstif/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lesstif/Config.in b/package/lesstif/Config.in
index 3a999ea..a6a88ec 100644
--- a/package/lesstif/Config.in
+++ b/package/lesstif/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LESSTIF
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_FREETYPE
+	depends on BR2_USE_MMU # fork()
 	help
 	  lesstif is the Hungry Programmers' version of OSF/Motif
 
