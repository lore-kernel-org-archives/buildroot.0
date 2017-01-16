From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:18:35 +0100
Subject: [Buildroot] [git commit] tslib: use upstream .tar.xz archive
Message-ID: <20170116124620.DE2937FB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2fa0472d14522557c8ac553a8553930658db502
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Save some network bandwidth.

[Peter: use TSLIB_VERSION instead of hardcoding 1.3]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.hash | 2 +-
 package/tslib/tslib.mk   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index a80944c..cdbe0d2 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256  599f51c265158e7801b166e879e19759e8d3e5fdf2fa99c630698fe162a41d56  tslib-1.3.tar.gz
+sha256  e935101adca980a14d1a13362796222575f99e6a41db585e8358fffddb98d92c  tslib-1.3.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 7f74ca5..2bf10eb 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -6,6 +6,7 @@
 
 TSLIB_VERSION = 1.3
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
+TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
 
