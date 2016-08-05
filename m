From: Romain Perier <romain.perier@free-electrons.com>
Date: Fri,  5 Aug 2016 16:53:56 +0200
Subject: [Buildroot] [PATCH v4 3/7] docs/manual: Document the variable
	$(PKG)_DL_OPTS
In-Reply-To: <1470408840-1509-1-git-send-email-romain.perier@free-electrons.com>
References: <1470408840-1509-1-git-send-email-romain.perier@free-electrons.com>
Message-ID: <1470408840-1509-4-git-send-email-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds a description of the optional variable $(PKG)_DL_OPTS. When it
is set, this option passes additional options to the downloader.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---

Changes in v4:
 - Add Reviewed-by tag

Changes in v3:
 - Improve documentation

Changes in v2:
 - Don't include the example in the snippet of code
 - Replaced $(PKG)_DL_REFERER by $(PKG)_DL_OPTS

 docs/manual/adding-packages-generic.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index ef895ec..51408e8 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -250,6 +250,13 @@ information is (assuming the package name is +libfoo+) :
     +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
     +LIBFOO_SITE=$(TOPDIR)/../src/libfoo+
 
+* +LIBFOO_DL_OPTS+ is a space-separated list of additional options to
+  pass to the downloader. Useful for retrieving documents with
+  server-side checking for user logins and passwords, or to use a proxy.
+  All download methods valid for +LIBFOO_SITE_METHOD+ are supported;
+  valid options depend on the download method (consult the man page
+  for the respective download utilities).
+
 * +LIBFOO_EXTRA_DOWNLOADS+ is a space-separated list of additional
   files that Buildroot should download. If an entry contains +://+
   then Buildroot will assume it is a complete URL and will download
-- 
2.8.1
