From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  7 Jan 2021 19:22:21 +0100
Subject: [Buildroot] [PATCH] package/pkgconf: bump to version 1.6.3
Message-ID: <20210107182221.938550-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...efix-with-the-sysroot-a-subset-of-variables.patch | 12 ++++++------
 ...in-assume-modversion-insted-of-version-if-o.patch |  2 +-
 package/pkgconf/pkgconf.hash                         |  4 ++--
 package/pkgconf/pkgconf.mk                           |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
index a7811752d..a039d0c1b 100644
--- a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
+++ b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
@@ -30,7 +30,7 @@ diff --git a/libpkgconf/tuple.c b/libpkgconf/tuple.c
 index 8523709..7cd2fff 100644
 --- a/libpkgconf/tuple.c
 +++ b/libpkgconf/tuple.c
-@@ -160,6 +160,21 @@ dequote(const char *value)
+@@ -161,6 +161,21 @@ dequote(const char *value)
  	return buf;
  }
  
@@ -52,7 +52,7 @@ index 8523709..7cd2fff 100644
  /*
   * !doc
   *
-@@ -180,6 +192,8 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
+@@ -181,6 +193,8 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
  {
  	char *dequote_value;
  	pkgconf_tuple_t *tuple = calloc(sizeof(pkgconf_tuple_t), 1);
@@ -61,7 +61,7 @@ index 8523709..7cd2fff 100644
  
  	pkgconf_tuple_find_delete(list, key);
  
-@@ -187,9 +201,13 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
+@@ -188,9 +202,13 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
  
  	PKGCONF_TRACE(client, "adding tuple to @%p: %s => %s (parsed? %d)", list, key, dequote_value, parse);
  
@@ -76,7 +76,7 @@ index 8523709..7cd2fff 100644
  	else
  		tuple->value = strdup(dequote_value);
  
-@@ -233,27 +251,14 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
+@@ -234,27 +252,14 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
  	return NULL;
  }
  
@@ -107,7 +107,7 @@ index 8523709..7cd2fff 100644
  		bptr += pkgconf_strlcpy(buf, client->sysroot_dir, sizeof buf);
  
  	for (ptr = value; *ptr != '\0' && bptr - buf < PKGCONF_BUFSIZE; ptr++)
-@@ -293,7 +298,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+@@ -294,7 +299,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  
  				if (kv != NULL)
  				{
@@ -116,7 +116,7 @@ index 8523709..7cd2fff 100644
  
  					strncpy(bptr, parsekv, PKGCONF_BUFSIZE - (bptr - buf));
  					bptr += strlen(parsekv);
-@@ -338,6 +343,25 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+@@ -339,6 +344,25 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  	return strdup(buf);
  }
  
diff --git a/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch b/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch
index e79bea93a..f659a3b07 100644
--- a/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch
+++ b/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch
@@ -19,7 +19,7 @@ diff --git a/cli/main.c b/cli/main.c
 index b52cc85..c5acc10 100644
 --- a/cli/main.c
 +++ b/cli/main.c
-@@ -955,18 +955,8 @@ main(int argc, char *argv[])
+@@ -1002,18 +1002,8 @@ main(int argc, char *argv[])
  
  	if ((want_flags & PKG_VERSION) == PKG_VERSION)
  	{
diff --git a/package/pkgconf/pkgconf.hash b/package/pkgconf/pkgconf.hash
index 45848af94..f210869c0 100644
--- a/package/pkgconf/pkgconf.hash
+++ b/package/pkgconf/pkgconf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	22b9ee38438901f9d60f180e5182821180854fa738fd071f593ea26a81da208c	pkgconf-1.6.1.tar.xz
-sha256	07ee94b50a41ee3fc4e13a9b9c60b26fc28488494c465639f7e5f07a3952ec04	COPYING
+sha256  61f0b31b0d5ea0e862b454a80c170f57bad47879c0c42bd8de89200ff62ea210  pkgconf-1.6.3.tar.xz
+sha256  07ee94b50a41ee3fc4e13a9b9c60b26fc28488494c465639f7e5f07a3952ec04  COPYING
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 1851ecfca..3d51258d6 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PKGCONF_VERSION = 1.6.1
+PKGCONF_VERSION = 1.6.3
 PKGCONF_SITE = https://distfiles.dereferenced.org/pkgconf
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
-- 
2.27.0
