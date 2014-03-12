From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Mar 2014 22:24:53 +0100
Subject: [Buildroot] [git commit] libcdio: need mmu
Message-ID: <20140312212628.3B7C99BF2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7fc6b59885534be5cf047eea53032cd618c93139
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/92b/92b6513a10bed9018d64e1347c99ff6db96990eb/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcdio/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libcdio/Config.in b/package/libcdio/Config.in
index 555eb29..fdc001e 100644
--- a/package/libcdio/Config.in
+++ b/package/libcdio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCDIO
 	bool "libcdio"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The GNU Compact Disc Input and Control library.
