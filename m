From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 11 Sep 2020 18:34:08 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/{protobuf,
 python-protobuf}: bump to version 3.13.0
In-Reply-To: <20200911163409.25778-1-buildroot@heine.tech>
References: <20200911163409.25778-1-buildroot@heine.tech>
Message-ID: <20200911163409.25778-3-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- updated hashes
- explicitly advise to update hash in python-protobuf
- changed link in python-protobuf to point to the protobuf site

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---

v1 -> v2
 - include python-protobuf in commit
  - update hash
  - fix project-link to point to the protobuf project

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 6 +++---
 package/python-protobuf/Config.in            | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index aa9d871561..c11f54edc3 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  ccfbaaba52f67e0e6536a05f3df3f6618620d255513cfca3a07f5935b624e26b  protobuf-cpp-3.12.4.tar.gz
+sha256  f8a547dfe143a9f61fadafba47fa6573713a33cb80909307c1502e26e1102298  protobuf-cpp-3.13.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 04fea3063e..5f2690603d 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # When bumping this package, make sure to also verify if the
-# python-protobuf package still works, as they share the same
-# version/site variables.
-PROTOBUF_VERSION = 3.12.4
+# python-protobuf package still works and to update its hash,
+# as they share the same version/site variables.
+PROTOBUF_VERSION = 3.13.0
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index c53ef7f822..1af82112b4 100644
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_PYTHON_PROTOBUF
 	  platform-neutral, extensible mechanism for serializing
 	  structured data.
 
-	  https://github.com/protobuf-c/protobuf-c
+	  https://developers.google.com/protocol-buffers
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index f723d584d1..4098d087ac 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ddafee267ec4cfa4b0afc74effd5644a96690036ecd2e310056d317f52e605f4  protobuf-python-3.12.4.tar.gz
+sha256  9c4d2ad449d27da5ac1db1ad5ecc4a642dedd6bbe59219d61d7b655b6b12be89  protobuf-python-3.13.0.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.25.1
