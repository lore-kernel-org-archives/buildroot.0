From: Romain Perier <romain.perier@free-electrons.com>
Date: Tue, 12 Jul 2016 11:30:17 +0200
Subject: [Buildroot] [PATCH v2 3/6] docs/manual: Document the variable
	$(PKG)_DL_OPTS
In-Reply-To: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
References: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
Message-ID: <1468315820-9341-4-git-send-email-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a description of the optional variable $(PKG)_DL_OPTS. When it
is set, this option passes additional options to the downloader.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
---

Changes in v2:
 - Don't include the example in the snippet of code
 - Replaced $(PKG)_DL_REFERER by $(PKG)_DL_OPTS

 docs/manual/adding-packages-generic.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 8ed7fe8..1ee983f 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -250,6 +250,11 @@ information is (assuming the package name is +libfoo+) :
     +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
     +LIBFOO_SITE=$(TOPDIR)/../src/libfoo+
 
+* +LIBFOO_DL_OPTS+ is a space-separated list of additional options to
+  pass to the downloader. Useful for retrieving documents with
+  server-side checking for user logins and passwords, or to use a proxy.
+  All download methods are supported.
+
 * +LIBFOO_EXTRA_DOWNLOADS+ is a space-separated list of additional
   files that Buildroot should download. If an entry contains +://+
   then Buildroot will assume it is a complete URL and will download
-- 
2.8.1
