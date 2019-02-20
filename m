From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 21 Feb 2019 00:12:07 +0100
Subject: [Buildroot] [git commit] package/libid3tag: fix id3tag.pc
Message-ID: <20190220231606.71A5B840A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa813cd9ac029a8373070ac2c1479dd9aa32ce59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add -lz to id3tag.pc, this fix is needed to be able to use pkg-config in
madplay to find id3tag dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
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
