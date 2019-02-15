From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Feb 2019 23:42:06 +0100
Subject: [Buildroot] [PATCH 1/2] package/libid3tag: fix id3tag.pc
Message-ID: <20190215224207.15546-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -lz to id3tag.pc, this fix is needed to be able to use pkg-config in
madplay to find id3tag dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libid3tag/id3tag.pc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libid3tag/id3tag.pc b/package/libid3tag/id3tag.pc
index 845eb3276b..c8b248766c 100644
--- a/package/libid3tag/id3tag.pc
+++ b/package/libid3tag/id3tag.pc
@@ -7,5 +7,5 @@ Name: id3tag
 Description: ID3 tag reading library
 Version: 0.15.1b
 Requires:
-Libs: -L${libdir} -lid3tag
+Libs: -L${libdir} -lid3tag -lz
 Cflags: -I${includedir}
-- 
2.14.1
