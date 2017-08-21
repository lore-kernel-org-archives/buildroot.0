From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:28:17 +0200
Subject: [Buildroot] [git commit branch/next] package/lzo: switch to cmake
Message-ID: <20170821212135.8C81D8015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61c4c63c79e37f86adf8af0ef896624af7ed4b77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

autoreconf for the host package is broken after bumping to 2.10:
http://lists.busybox.net/pipermail/buildroot/2017-August/200634.html

To solve the problem we switch to cmake.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzo/lzo.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 5b8efdd..dba965f 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -9,9 +9,7 @@ LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPL-2.0+
 LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
-# Ships a beta libtool version hence our patch doesn't apply.
-# Run autoreconf to regenerate ltmain.sh.
-LZO_AUTORECONF = YES
+LZO_SUPPORTS_IN_SOURCE_BUILD = NO
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
