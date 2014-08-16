From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 09:29:59 +0200
Subject: [Buildroot] [git commit] manual-text: make sure URLs are displayed
	if a link text was provided
Message-ID: <20140816073245.360E99C552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67274a9b6ffbb6266e253746bb257847e48e5566
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/asciidoc-text.conf |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/docs/manual/asciidoc-text.conf b/docs/manual/asciidoc-text.conf
new file mode 100644
index 0000000..671cf3a
--- /dev/null
+++ b/docs/manual/asciidoc-text.conf
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
