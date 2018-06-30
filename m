From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jun 2018 13:29:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.8.3
Message-ID: <20180630112907.20702-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream.

Release notes: https://www.samba.org/samba/history/samba-4.8.3.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0004-libgpo-fix-build-without-ads.patch   | 49 -------------------
 package/samba4/samba4.hash                    |  4 +-
 package/samba4/samba4.mk                      |  2 +-
 3 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 package/samba4/0004-libgpo-fix-build-without-ads.patch

diff --git a/package/samba4/0004-libgpo-fix-build-without-ads.patch b/package/samba4/0004-libgpo-fix-build-without-ads.patch
deleted file mode 100644
index 5e3af3c322..0000000000
--- a/package/samba4/0004-libgpo-fix-build-without-ads.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a222b7506b53e689708834237f18877231dca589 Mon Sep 17 00:00:00 2001
-From: Volker Lendecke <vl@samba.org>
-Date: Sat, 3 Feb 2018 07:07:55 +0100
-Subject: [PATCH] libgpo: Fix the build --without-ads
-
-Signed-off-by: Volker Lendecke <vl@samba.org>
-Reviewed-by: David Disseldorp <ddiss@samba.org>
-
-Autobuild-User(master): David Disseldorp <ddiss@samba.org>
-Autobuild-Date(master): Tue Feb  6 15:36:01 CET 2018 on sn-devel-144
-
-Downloaded from upstream commit:
-https://git.samba.org/samba.git/?p=samba.git;a=commit;h=a222b7506b53e689708834237f18877231dca589
-
-Fixes https://bugzilla.samba.org/show_bug.cgi?id=13331
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libgpo/pygpo.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libgpo/pygpo.c b/libgpo/pygpo.c
-index 7a02a0dc2aa..b6b53b76212 100644
---- a/libgpo/pygpo.c
-+++ b/libgpo/pygpo.c
-@@ -319,6 +319,7 @@ static PyObject *py_gpo_get_sysvol_gpt_version(PyObject * self,
- 	return result;
- }
- 
-+#ifdef HAVE_ADS
- static ADS_STATUS find_samaccount(ADS_STRUCT *ads, TALLOC_CTX *mem_ctx,
- 				  const char *samaccountname,
- 				  uint32_t *uac_ret, const char **dn_ret)
-@@ -468,11 +469,15 @@ static PyObject *py_ads_get_gpo_list(ADS *self, PyObject *args, PyObject *kwds)
- 	return ret;
- }
- 
-+#endif
-+
- static PyMethodDef ADS_methods[] = {
- 	{ "connect", (PyCFunction)py_ads_connect, METH_NOARGS,
- 		"Connect to the LDAP server" },
-+#ifdef HAVE_ADS
- 	{ "get_gpo_list", (PyCFunction)py_ads_get_gpo_list, METH_KEYWORDS,
- 		NULL },
-+#endif
- 	{ NULL }
- };
- 
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index cadb88b260..4b1b1218ac 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.8.2.tar.asc
-sha256 62e552296d49e6ab44bb87d120a288813fa52e42435d53a1f71b77596512bf22  samba-4.8.2.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.8.3.tar.asc
+sha256 e0569a8a605d5dfb49f1fdd11db796f4d36fe0351c4a7f21387ef253010b82ed  samba-4.8.3.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index f75b350375..52d59ffeb9 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.8.2
+SAMBA4_VERSION = 4.8.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.17.1
