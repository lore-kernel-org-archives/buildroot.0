From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Feb 2019 14:40:16 +0100
Subject: [Buildroot] [PATCH v2,1/2] package/libid3tag: fix id3tag.pc
Message-ID: <20190216134017.3083-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -lz to id3tag.pc, this fix is needed to be able to use pkg-config in
madplay to find id3tag dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Move -lz from Libs to Libs.private

 package/libid3tag/id3tag.pc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libid3tag/id3tag.pc b/package/libid3tag/id3tag.pc
index 845eb3276b..63d09eee8b 100644
--- a/package/libid3tag/id3tag.pc
+++ b/package/libid3tag/id3tag.pc
@@ -8,4 +8,5 @@ Description: ID3 tag reading library
 Version: 0.15.1b
 Requires:
 Libs: -L${libdir} -lid3tag
+Libs.private: -lz
 Cflags: -I${includedir}
-- 
2.14.1
