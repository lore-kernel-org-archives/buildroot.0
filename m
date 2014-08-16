From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 09:29:59 +0200
Subject: [Buildroot] [git commit] manual-text: hide image representations
Message-ID: <20140816073245.3E4A39C552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb00e141497d5cd2a1e784690ef6a6dfd48af25b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Images specified in the asciidoc sources (currently only the logo) are
displayed as the file name in the text version of the manual. This causes an
odd line to appear:
    logo.png

Avoid this by setting the image representation macros to {empty} in
manual-text.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/asciidoc-text.conf |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/docs/manual/asciidoc-text.conf b/docs/manual/asciidoc-text.conf
index 671cf3a..470bdec 100644
--- a/docs/manual/asciidoc-text.conf
+++ b/docs/manual/asciidoc-text.conf
@@ -15,3 +15,9 @@
 {0=}{0? &#91;}{name}:{target}{0?&#93;}
 [mailto-inlinemacro]
 {0=}{0? &#91;}{name}:{target}{0?&#93;}
+
+# Hide image representation from text manual
+[image-inlinemacro]
+{empty}
+[image-blockmacro]
+{empty}
