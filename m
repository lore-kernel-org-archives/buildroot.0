From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 31 Oct 2010 17:35:11 +0100
Subject: [Buildroot] [PATCH 3/8] package/config: update quilt series
In-Reply-To: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1288542916-21883-4-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the patches so they apply without offset

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 .../patches/03-change-config-option-prefix.patch   |   10 +++++-----
 .../patches/09-implement-kconfig-probability.patch |    4 ++--
 .../patches/14-support-out-of-tree-config.patch    |   12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/config/patches/03-change-config-option-prefix.patch b/package/config/patches/03-change-config-option-prefix.patch
index 5b76df3..dd645b1 100644
--- a/package/config/patches/03-change-config-option-prefix.patch
+++ b/package/config/patches/03-change-config-option-prefix.patch
@@ -2,10 +2,10 @@
  confdata.c |   49 +++++++++++++++++++++++--------------------------
  1 file changed, 23 insertions(+), 26 deletions(-)
 
-Index: config.new/confdata.c
+Index: config/confdata.c
 ===================================================================
---- config.new.orig/confdata.c
-+++ config.new/confdata.c
+--- config.orig/confdata.c
++++ config/confdata.c
 @@ -11,6 +11,7 @@
  #include <string.h>
  #include <time.h>
@@ -128,7 +128,7 @@ Index: config.new/confdata.c
  		break;
  	case S_OTHER:
  	case S_UNKNOWN:
-@@ -834,14 +831,14 @@
+@@ -838,14 +835,14 @@
  			case no:
  				break;
  			case mod:
@@ -147,7 +147,7 @@ Index: config.new/confdata.c
  				break;
  			}
  			break;
-@@ -851,12 +848,12 @@
+@@ -855,12 +852,12 @@
  		case S_HEX:
  			str = sym_get_string_value(sym);
  			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
diff --git a/package/config/patches/09-implement-kconfig-probability.patch b/package/config/patches/09-implement-kconfig-probability.patch
index 7561fbc..5983779 100644
--- a/package/config/patches/09-implement-kconfig-probability.patch
+++ b/package/config/patches/09-implement-kconfig-probability.patch
@@ -6,7 +6,7 @@ Index: config/confdata.c
 ===================================================================
 --- config.orig/confdata.c
 +++ config/confdata.c
-@@ -977,7 +977,16 @@
+@@ -981,7 +981,16 @@
  void conf_set_all_new_symbols(enum conf_def_mode mode)
  {
  	struct symbol *sym, *csym;
@@ -24,7 +24,7 @@ Index: config/confdata.c
  
  	for_all_symbols(i, sym) {
  		if (sym_has_value(sym))
-@@ -996,8 +1005,15 @@
+@@ -1000,8 +1009,15 @@
  				sym->def[S_DEF_USER].tri = no;
  				break;
  			case def_random:
diff --git a/package/config/patches/14-support-out-of-tree-config.patch b/package/config/patches/14-support-out-of-tree-config.patch
index fb1cca1..3c2a523 100644
--- a/package/config/patches/14-support-out-of-tree-config.patch
+++ b/package/config/patches/14-support-out-of-tree-config.patch
@@ -41,7 +41,7 @@ Index: config/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -656,6 +657,7 @@
+@@ -658,6 +659,7 @@
  {
  	const char *name;
  	char path[128];
@@ -49,7 +49,7 @@ Index: config/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -664,8 +666,20 @@
+@@ -666,8 +668,20 @@
  	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
@@ -72,7 +72,7 @@ Index: config/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -758,9 +772,11 @@
+@@ -760,9 +774,11 @@
  		close(fd);
  	}
  out:
@@ -87,7 +87,7 @@ Index: config/confdata.c
  	return res;
  }
  
-@@ -772,25 +788,38 @@
+@@ -774,25 +790,38 @@
  	FILE *out, *tristate, *out_h;
  	time_t now;
  	int i;
@@ -130,7 +130,7 @@ Index: config/confdata.c
  	if (!out_h) {
  		fclose(out);
  		fclose(tristate);
-@@ -811,8 +840,7 @@
+@@ -815,8 +844,7 @@
  	fprintf(out_h, "/*\n"
  		       " * Automatically generated C config: don't edit\n"
  		       " * %s"
@@ -140,7 +140,7 @@ Index: config/confdata.c
  		       ctime(&now));
  
  	for_all_symbols(i, sym) {
-@@ -866,19 +894,22 @@
+@@ -870,19 +898,22 @@
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
  		name = "include/generated/autoconf.h";
-- 
1.7.1
