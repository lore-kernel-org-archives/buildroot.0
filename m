From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 14:59:01 +0200
Subject: [Buildroot] [git commit branch/next] docs/manual: Document the
	variable $(PKG)_DL_OPTS
Message-ID: <20160823125905.38D0481E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03f12377178e209f599f00b3fafb33dfa649abc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This adds a description of the optional variable $(PKG)_DL_OPTS. When it
is set, this option passes additional options to the downloader.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
