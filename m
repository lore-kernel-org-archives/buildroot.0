From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:43:01 +0100
Subject: [Buildroot] [PATCH 18/18] package/ejabberd: bump version to 20.07
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-18-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix the download url to reflect upstream website changes.
- Fix line numbers in patch 0001.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 ....in-do-not-download-or-compile-dependencies.patch | 12 ++++++------
 package/ejabberd/ejabberd.hash                       |  4 ++--
 package/ejabberd/ejabberd.mk                         |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
index 01a5362e5f..ffacb6dafd 100644
--- a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
+++ b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
@@ -1,6 +1,6 @@
-From 277103e886c9b3ddfede8b3f5b92d3e94736f404 Mon Sep 17 00:00:00 2001
+From cb583beba1acba55112fbb4636c1c73d9ae691a0 Mon Sep 17 00:00:00 2001
 From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Fri, 23 Nov 2018 16:13:21 +0100
+Date: Fri, 20 Nov 2020 00:33:30 +0100
 Subject: [PATCH] Makefile.in: do not download or compile dependencies
 
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
@@ -9,10 +9,10 @@ Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 48dca7d8..d2324dae 100644
+index abd64835..06f876bb 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -94,7 +94,7 @@ ifneq ($(INSTALLGROUP),)
+@@ -97,7 +97,7 @@ ifneq ($(INSTALLGROUP),)
    G_USER=-g $(INSTALLGROUP)
  endif
  
@@ -21,7 +21,7 @@ index 48dca7d8..d2324dae 100644
  
  deps: deps/.got
  
-@@ -108,7 +108,7 @@ deps/.built: deps/.got
+@@ -111,7 +111,7 @@ deps/.built: deps/.got
  	$(REBAR) configure-deps
  	$(REBAR) compile && :> deps/.built
  
@@ -31,5 +31,5 @@ index 48dca7d8..d2324dae 100644
  
  update:
 -- 
-2.17.1
+2.29.2
 
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index 145e7401a9..0d57ada5bb 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 18ddf61af22fc9b59f8afc6835aae2aee9896eb91cc1030056d6bca6a1fa40d2 ejabberd-19.09.1.tgz
-sha256 469bb8cfa3ef22c102875ff31932450c075e6908ff3f7d36893485c0c30898eb COPYING
+sha256  9e922b938458ae9d72d4e5fdd2d08a1fbad651aae47c9a9d15b79d0bbd1e11f8  ejabberd-20.07.tgz
+sha256  469bb8cfa3ef22c102875ff31932450c075e6908ff3f7d36893485c0c30898eb  COPYING
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 3419c6e59c..a0b4a63542 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 19.09.1
+EJABBERD_VERSION = 20.07
 EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
-EJABBERD_SITE = https://www.process-one.net/downloads/ejabberd/$(EJABBERD_VERSION)
+EJABBERD_SITE = https://static.process-one.net/ejabberd/downloads/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
 EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
-- 
2.25.1
