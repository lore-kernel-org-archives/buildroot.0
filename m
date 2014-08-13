From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Aug 2014 21:25:51 +0200
Subject: [Buildroot] [PATCH 5 of 5 v3 for 2014.08] manual-text: hide image
	representations
In-Reply-To: <patchbomb.1407957946@localhost>
References: <patchbomb.1407957946@localhost>
Message-ID: <f719ffa3eed536b4a0de.1407957951@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Images specified in the asciidoc sources (currently only the logo) are
displayed as the file name in the text version of the manual. This causes an
odd line to appear:
    logo.png

Avoid this by setting the image representation macros to {empty} in
manual-text.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: no changes
v2: no changes

 docs/manual/asciidoc-text.conf |  6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff -r 72d825eab688 -r f719ffa3eed5 docs/manual/asciidoc-text.conf
--- a/docs/manual/asciidoc-text.conf	Sat Aug 09 19:42:30 2014 +0200
+++ b/docs/manual/asciidoc-text.conf	Sun Aug 10 17:55:54 2014 +0200
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
