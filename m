From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Mon, 19 Aug 2019 11:43:46 +0200
Subject: [Buildroot] [PATCH next v2 1/1] package/libgit2: bump version to
 0.28.3
In-Reply-To: <20190819085918.25899-1-nicolas.cavallari@green-communications.fr>
References: <20190819085918.25899-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20190819094346.27233-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the cURL dependency, since they reimplemented a HTTP client.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
v1 -> v2: remove curl dependency

0.28.3 and 0.27.9 contains the same security fixes.
master already has 0.27.9, but next is still at 0.27.8.

 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 54e309172a..f445e4cf0f 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	8313873d49dc01e8b880ec334d7430ae67496a89aaa8c6e7bbd3affb47a00c76  libgit2-0.27.8.tar.gz
+sha256	ee5344730fe11ce7c86646e19c2d257757be293f5a567548d398fb3af8b8e53b  libgit2-0.28.3.tar.gz
 sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index b8880fea81..e4d887d9b2 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 0.27.8
+LIBGIT2_VERSION = 0.28.3
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception
 LIBGIT2_LICENSE_FILES = COPYING
@@ -41,11 +41,4 @@ else
 LIBGIT2_CONF_OPTS += -DUSE_HTTPS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-LIBGIT2_DEPENDENCIES += libcurl
-LIBGIT2_CONF_OPTS += -DCURL=ON
-else
-LIBGIT2_CONF_OPTS += -DCURL=OFF
-endif
-
 $(eval $(cmake-package))
-- 
2.23.0.rc1
