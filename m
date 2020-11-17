From: Michael Nosthoff <buildroot@heine.tech>
Date: Tue, 17 Nov 2020 17:26:46 +0100
Subject: [Buildroot] [PATCH] package/{protobuf,
 python-protobuf}: bump to version 3.14.0
Message-ID: <20201117162647.1946565-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-protobuf: drop patch 0001 as it is applied upstream

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash                |  2 +-
 package/protobuf/protobuf.mk                  |  2 +-
 ....py-remove-unneeded-wheel-dependency.patch | 41 -------------------
 package/python-protobuf/python-protobuf.hash  |  2 +-
 4 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 package/python-protobuf/0001-python-setup.py-remove-unneeded-wheel-dependency.patch

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index c11f54edc3..001b41be9a 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  f8a547dfe143a9f61fadafba47fa6573713a33cb80909307c1502e26e1102298  protobuf-cpp-3.13.0.tar.gz
+sha256  50ec5a07c0c55d4ec536dd49021f2e194a26bfdbc531d03d1e9d4d3e27175659  protobuf-cpp-3.14.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 5f2690603d..401b351c0a 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 3.13.0
+PROTOBUF_VERSION = 3.14.0
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/0001-python-setup.py-remove-unneeded-wheel-dependency.patch b/package/python-protobuf/0001-python-setup.py-remove-unneeded-wheel-dependency.patch
deleted file mode 100644
index 1646f0808c..0000000000
--- a/package/python-protobuf/0001-python-setup.py-remove-unneeded-wheel-dependency.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9f8a6ed7fda9abf474ce886dddf3ab5abc0ead0b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 Sep 2020 10:52:32 +0200
-Subject: [PATCH] python/setup.py: remove unneeded wheel dependency
-
-wheel is required since version 3.13.0 and
-https://github.com/protocolbuffers/protobuf/commit/ff92cee10bcae7533b573368f448e782fbd43f39
-
-This will result in the following build failure when cross-compiling:
-
-Download error on https://pypi.org/simple/wheel/: unknown url type: https -- Some packages may not be found!
-Couldn't find index page for 'wheel' (maybe misspelled?)
-Download error on https://pypi.org/simple/: unknown url type: https -- Some packages may not be found!
-No local packages or working download links found for wheel
-
-Remove wheel requirement from setup.py as it is only needed by
-release.sh, not by setup.py
-
-Fixes:
- - http://autobuild.buildroot.org/results/371c686a10d6870933011b46d36b1879d29046b9
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- python/setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/python/setup.py b/python/setup.py
-index b44e88b2f..39eb18d4b 100755
---- a/python/setup.py
-+++ b/python/setup.py
-@@ -293,7 +293,6 @@ if __name__ == '__main__':
-           'build_py': build_py,
-           'test_conformance': test_conformance,
-       },
--      setup_requires = ['wheel'],
-       install_requires=install_requires,
-       ext_modules=ext_module_list,
-   )
--- 
-2.28.0
-
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 4098d087ac..c8762b5416 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9c4d2ad449d27da5ac1db1ad5ecc4a642dedd6bbe59219d61d7b655b6b12be89  protobuf-python-3.13.0.tar.gz
+sha256  969019c5fd9c1345f0b34afa06ab2664c1441d159d5ae87ded5fa01d79f028c1  protobuf-python-3.14.0.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.25.1
