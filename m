From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jul 2014 00:00:36 +0200
Subject: [Buildroot] [PATCH 2/6 v3] manual: add gettextize explanations in
	the manual
In-Reply-To: <cover.1405547907.git.yann.morin.1998@free.fr>
References: <cover.1405547907.git.yann.morin.1998@free.fr>
Message-ID: <b15cc7db006e129bbc4ea0ca2cef0ca971bb4ae9.1405547907.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v2 -> v3:
  - fix typoes  (Gustavo)

Changes v1 -> v2:
  - gettextize is only valid if autoreconf=yes  (Gustavo)
---
 docs/manual/adding-packages-autotools.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index c7e797f..3f40503 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -125,6 +125,18 @@ cases, typical packages will therefore only use a few of them.
   passed to the 'autoreconf' program if
   +LIBFOO_AUTORECONF=YES+. By default, empty.
 
+* +LIBFOO_GETTEXTIZE+, tells whether the package should be
+  gettextized or not (i.e. if the package uses a different gettext
+  version than Buildroot provides, and it is needed to run
+  'gettextize'.) Only valid when +LIBFOO_AUTORECONF=YES+. Valid
+  values are +YES+ and +NO+. The default is +NO+.
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
1.9.1
