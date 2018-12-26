From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 15:11:04 +0100
Subject: [Buildroot] [git commit] package/webkitgtk: fix host dependencies
Message-ID: <20181226140646.5C1B7838EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=188da35eda0dc4fc39feec37ff17b0403daeb529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python 2.7 is required by the cmake stuff.
bison & flex are not used in the webkitgtk tree.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/webkitgtk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 9a1b392bb5..152f42bd7c 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -12,7 +12,7 @@ WEBKITGTK_LICENSE = LGPL-2.1+, BSD-2-Clause
 WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-APPLE \
 	Source/WebCore/LICENSE-LGPL-2.1
-WEBKITGTK_DEPENDENCIES = host-ruby host-flex host-bison host-gperf \
+WEBKITGTK_DEPENDENCIES = host-ruby host-python host-gperf \
 	enchant harfbuzz icu jpeg libgcrypt libgtk3 libsecret libsoup \
 	libtasn1 libxml2 libxslt sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
