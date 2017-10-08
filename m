From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 23:19:20 +0200
Subject: [Buildroot] [git commit] msgpack: bump version to 2.1.5
Message-ID: <20171008211213.201FD81110@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f526687d6214dbe7dd48ddab34182f4a5fc2fbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Modern versions of msgpack are hosted on Github. Msgpack switched
their build systems from autotools to cmake a while back. The licence
was also updated from Apache to Boost.

Signed-off-by: bradford barr <bradford@density.io>
[Thomas: drop custom install commands, add LICENSE_1_0.txt to license
files.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/msgpack/msgpack.hash |  2 +-
 package/msgpack/msgpack.mk   | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/msgpack/msgpack.hash b/package/msgpack/msgpack.hash
index 8cd8cb6..f1033ad 100644
--- a/package/msgpack/msgpack.hash
+++ b/package/msgpack/msgpack.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  97a371ef950c89f48e8dba6abeccab07f1887e9ba6dab921de0f985c7d5075fe  msgpack-0.5.4.tar.gz
+sha256  9c87f80fc651b900772deaef0ab154b63160c74d292529b5be6d06d6485d4640  msgpack-2.1.5.tar.gz
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 9e23948..f6f3ab0 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-MSGPACK_VERSION = 0.5.4
-MSGPACK_SITE = http://downloads.sourceforge.net/project/msgpack/msgpack/cpp
-MSGPACK_LICENSE = Apache-2.0
-MSGPACK_LICENSE_FILES = COPYING
+MSGPACK_VERSION = 2.1.5
+MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
+MSGPACK_LICENSE = BSL-1.0
+MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
+MSGPACK_INSTALL_STAGING = YES
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
