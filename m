From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Apr 2014 00:20:04 +0200
Subject: [Buildroot] [PATCH 2/3] manual: add gettextize explanations in the
	manual
In-Reply-To: <cover.1397081821.git.yann.morin.1998@free.fr>
References: <cover.1397081821.git.yann.morin.1998@free.fr>
Message-ID: <88da7a58ab8bfb49816b875d6da17e4d0edf7e7c.1397081821.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 docs/manual/adding-packages-autotools.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index cc668b5..9181fb8 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -128,6 +128,18 @@ cases, typical packages will therefore only use a few of them.
   passed to the 'autoreconf' program if
   +LIBFOO_AUTORECONF=YES+. By default, empty.
 
+* +LIBFOO_GETTEXTIZE+, tells whether the package should be
+  gettextized or not (i.e. if the pacakge uses an different gettext
+  version than Buildroot provides, and it is needed to run
+  'gettextize'.) Valid values are +YES+ and   +NO+. The default
+  is +NO+.
+
+* +LIBFOO_GETTEXTIZE_OPT+, to specify additional options passed to
+  the 'gettextize' program, if +LIBFOO_GETTEXTIZE=YES+. You may
+  use that if, for example, the +.po+ files are not located in the
+  standard place (i.e. in +po/+ at the root of the package.) By
+  default, '-f'.
+
 * +LIBFOO_LIBTOOL_PATCH+ tells whether the Buildroot
   patch to fix libtool cross-compilation issues should be applied or
   not. Valid values are +YES+ and +NO+. By
-- 
1.8.3.2
