From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Aug 2014 15:40:37 +0200
Subject: [Buildroot] [PATCH 4 of 5 v4 for 2014.08] manual-text: make sure
 URLs are displayed if a link text was provided
In-Reply-To: <patchbomb.1408110033@localhost>
References: <patchbomb.1408110033@localhost>
Message-ID: <93b82c1cf8a4a7cf3212.1408110037@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the asciidoc source contain URLs of the form:
    http://example.com[An example website]
the text representation of the manual would only contain:
    An example website
without displaying the actual URL.

This patch adds an asciidoc configuration file that sets the inline macros
for several URL types so that the display becomes:
    An example website [http://example.com]
For URLs where no link text was provided, the display becomes:
    http://example.com
which is the same as before.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>

---
v4: no changes
v3: no changes
v2:
- link to relevant documentation (which was hard to find)
- refine so that the display is identical to before when no link text is
  provided.

 docs/manual/asciidoc-text.conf |  17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff -r 81d40b841073 -r 93b82c1cf8a4 docs/manual/asciidoc-text.conf
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/docs/manual/asciidoc-text.conf	Sat Aug 09 19:42:30 2014 +0200
@@ -0,0 +1,17 @@
+# Refer to following asciidoc documentation:
+#     http://www.methods.co.nz/asciidoc/userguide.html
+# In particular sections "Macros" and "Attribute References"
+#
+# For hyperlinks, show 'link text [URL]' (if link text provided) or 'URL'
+[http-inlinemacro]
+{0=}{0? &#91;}{name}:{target}{0?&#93;}
+[https-inlinemacro]
+{0=}{0? &#91;}{name}:{target}{0?&#93;}
+[ftp-inlinemacro]
+{0=}{0? &#91;}{name}:{target}{0?&#93;}
+[file-inlinemacro]
+{0=}{0? &#91;}{name}:{target}{0?&#93;}
+[irc-inlinemacro]
+{0=}{0? &#91;}{name}:{target}{0?&#93;}
+[mailto-inlinemacro]
+{0=}{0? &#91;}{name}:{target}{0?&#93;}
