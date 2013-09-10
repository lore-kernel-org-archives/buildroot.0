From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 10 Sep 2013 21:51:02 +0200
Subject: [Buildroot] [git commit] libroxml: needs threads
Message-ID: <20130910200702.B0F8A9B6A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b4ef4a4b27a9cff47cefc0a3e011006f643773a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/169/169b607993cd7ae4a8a79c2a00c00f820ec1c747/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libroxml/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libroxml/Config.in b/package/libroxml/Config.in
index b6b253f..e1a646f 100644
--- a/package/libroxml/Config.in
+++ b/package/libroxml/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBROXML
 	bool "roxml"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libroxml is a light and powerful xml parsing library with
 	  xpath handling. Roxml is a binary using libroxml to explore
 	  xml file from shell scripts.
 
 	  http://www.libroxml.net
+
+comment "libroxml needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
