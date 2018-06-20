From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 20 Jun 2018 16:41:19 -0500
Subject: [Buildroot] [PATCH v2] protobuf: bump to 3.6.0
Message-ID: <20180620214119.28934-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(also bumps protobuf-python)

Fixes the following issue and brauto builds
https://github.com/google/protobuf/issues/3937
http://autobuild.buildroot.net/results/982f727495c1d3524685015c34b1cbb1e0bbb4b0
http://autobuild.buildroot.net/results/adbd3088e24d7e681c995f8c3d1db0e14ac500ba

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

Changes v1 -> v2
[Matt
 - Add hash files for licenses

[Peter
 - Update protobuf-python's hash
---
 package/protobuf/protobuf.hash               | 3 ++-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 4492487efb..bcd1f64de0 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 c28dba8782da2cfea1e11c61d335958c31a9c1bc553063546af9cbe98f204092 protobuf-cpp-3.5.1.tar.gz
+sha256 c3cab055964d554e4fd85067fe3e9eb45c9915cebcf537e97fafaa245376bce1  protobuf-cpp-3.6.0.tar.gz
+sha256 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 1440589c14..9caf87ed93 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works, as they share the same
 # version/site variables.
-PROTOBUF_VERSION = 3.5.1
+PROTOBUF_VERSION = 3.6.0
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 9c7606ce34..652751c7b6 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 13d3c15ebfad8c28bee203dd4a0f6e600d2a7d2243bac8b5d0e517466500fcae protobuf-python-3.5.1.tar.gz
+sha256 6b399412cd68c7efe64d31824ad0db44f803aed91d0c6a9ea94272682c3da2df  protobuf-python-3.6.0.tar.gz
+sha256 6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.17.0
