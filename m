From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Aug 2018 10:06:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Remove warning from Config.in
Message-ID: <20180811080647.16373-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Four years ago this warning was added to this package
https://git.buildroot.net/buildroot/commit/package/vlc?id=e33019aaa0409e35b725dddffe09e3e2a42959d1
due to "autobuilder failures for vlc on many platforms".

The last autobuilder failure occured May 1st, 2018 and was fixed by
https://git.buildroot.net/buildroot/commit/package/vlc?id=9f115bfc2ac798c737d0c2a8ec8c96670e814a49

Therefore this warning is not needed anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 166e7d256a..78769ac27b 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -1,8 +1,3 @@
-if BR2_PACKAGE_VLC
-comment "vlc is known not to work in all configurations"
-comment "If you can fix it, please inform buildroot at buildroot.org"
-endif
-
 config BR2_PACKAGE_VLC
 	bool "vlc"
 	depends on BR2_USE_MMU # fork()
-- 
2.18.0
