From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jan 2019 16:59:16 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/webkitgtk: fix
 host dependencies
Message-ID: <20190101155617.655EE803FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93d8af974346d95e66f5582e420dd0fb35d32916
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

python 2.7 is required by the cmake stuff.
bison & flex are not used in the webkitgtk tree.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 188da35eda0dc4fc39feec37ff17b0403daeb529)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
