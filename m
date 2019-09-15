From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 15 Sep 2019 16:01:13 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: add missing host-perl
 dependency
Message-ID: <20190915130113.53523-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/faa23c0e648b916d0fb01adb95948234d6db7a71/

The JSON::PP module is included within the Perl installation. WebKit
has some scripts used at build time which require Perl installed in
the host.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 97e3311654..74c832d5df 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -12,7 +12,7 @@ WEBKITGTK_LICENSE = LGPL-2.1+, BSD-2-Clause
 WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
-WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
+WEBKITGTK_DEPENDENCIES = host-ruby host-perl host-python host-gperf \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
-- 
2.23.0
