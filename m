From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 15 Sep 2019 16:10:39 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add missing host-perl
 dependency
Message-ID: <20190915131039.54385-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoids issues like this, which happened for webkitgtk:
http://autobuild.buildroot.net/results/faa23c0e648b916d0fb01adb95948234d6db7a71/

The JSON::PP module is included within the Perl installation. WebKit
has some scripts used at build time which require Perl installed in
the host.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 48ed4f4afe..f4cd2c78bf 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -12,7 +12,7 @@ WPEWEBKIT_LICENSE = LGPL-2.1+, BSD-2-Clause
 WPEWEBKIT_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
-WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
+WPEWEBKIT_DEPENDENCIES = host-gperf host-perl host-python host-ruby \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
 
-- 
2.23.0
