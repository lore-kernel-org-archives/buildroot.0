From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 15 Feb 2015 21:23:58 +0100
Subject: [Buildroot] [PATCH for master 2/2] pkg-stats: ignore
	linux-ext-fbtft.mk and doc-asciidoc.mk
In-Reply-To: <1424031838-16804-1-git-send-email-fabio.porcedda@gmail.com>
References: <1424031838-16804-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1424031838-16804-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 support/scripts/pkg-stats | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9af974d..fad7ae9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -94,6 +94,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 
     if test \
 	$i = "boot/common.mk" -o \
+	$i = "linux/linux-ext-fbtft.mk" -o \
 	$i = "linux/linux-ext-xenomai.mk" -o \
 	$i = "linux/linux-ext-rtai.mk" -o \
 	$i = "package/efl/efl.mk" -o \
@@ -106,6 +107,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "package/opengl/opengl.mk" -o \
 	$i = "package/qt5/qt5.mk" -o \
 	$i = "package/x11r7/x11r7.mk" -o \
+	$i = "package/doc-asciidoc.mk" -o \
 	$i = "package/pkg-autotools.mk" -o \
 	$i = "package/pkg-cmake.mk" -o \
 	$i = "package/pkg-kconfig.mk" -o \
-- 
2.3.0
