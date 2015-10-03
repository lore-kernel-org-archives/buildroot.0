From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  3 Oct 2015 23:18:21 +0200
Subject: [Buildroot] [PATCH v2 4/4] docs/manual: document new actual source
	package variables
In-Reply-To: <1443907101-5290-1-git-send-email-luca@lucaceresoli.net>
References: <1443907101-5290-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1443907101-5290-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-packages-generic.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 40798c0..9d6401f 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -388,6 +388,25 @@ information is (assuming the package name is +libfoo+) :
   to let you know, and +not saved+ will appear in the +license files+ field
   of the manifest file for this package.
 
+* +LIBFOO_ACTUAL_SOURCE_TARBALL+ only applies to packages whose
+  +LIBFOO_SITE+ / +LIBTOO_SOURCE+ pair points to an archive that does
+  not actually contain source code, but binary code. This a very
+  uncommon case, only known to apply to external toolchains which come
+  already compiled, although theoretically it might apply to other
+  packages. In such cases a separate tarball is usually available with
+  the actual source code. Set +LIBFOO_ACTUAL_SOURCE_TARBALL+ to the
+  name of the actual source code archive and Buildroot will download
+  it and use it when you run +make legal-info+ to collect
+  legally-relevant material.  Note this file will not be downloaded
+  during regular builds nor by +make source+.
+
+* +LIBFOO_ACTUAL_SOURCE_SITE+ provides the location of the actual
+  source tarball. The default value is +LIBFOO_SITE+, so you don't
+  need to set this variable if the binary and source archives are
+  hosted on the same directory.  If +LIBFOO_ACTUAL_SOURCE_TARBALL+ is
+  not set, it doesn't make sense to define
+  +LIBFOO_ACTUAL_SOURCE_SITE+.
+
 * +LIBFOO_REDISTRIBUTE+ can be set to +YES+ (default) or +NO+ to indicate if
   the package source code is allowed to be redistributed. Set it to +NO+ for
   non-opensource packages: Buildroot will not save the source code for this
-- 
1.9.1
