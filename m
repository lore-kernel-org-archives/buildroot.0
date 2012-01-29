From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 21:33:27 +0100
Subject: [Buildroot] [git commit] libevas: force smooth scaling option on
Message-ID: <20120129222325.0729B90042@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9382d641a542d6fa152c895b12ebcf2c0554f37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libevas fails to build if smooth scaling isn't enabled with unresolved
references to evas_common_map_rgba_internal and
evas_common_scale_rgba_in_to_out_clip_smooth.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index 6ec05d5..f5e79b3 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBEVAS
 	bool "libevas"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBEINA
+	# required to build so far
+	select BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH
 	help
 	  Evas is a clean display canvas API for several target
 	  display systems that can draw anti-aliased text, smooth
