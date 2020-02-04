From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 10:49:20 +0100
Subject: [Buildroot] [git commit] package/xen: bump to version 4.13.0
Message-ID: <20200204094059.400308A47A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=268e5689b5219890df8cec6e77f8783a8d1f95a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest version of Xen and remove the no longer required
patch.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 3 +--
 package/xen/xen.mk   | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 672ba5cb8d..22a6083d9b 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,4 +1,3 @@
 # Locally computed
-sha256 1c75cbe728dfabf02b7f9a17ce96ee7d202d2fd4b4689490018d3a28b63f9fa3 xen-4.12.2.tar.gz
-sha256 9b2078d448e4815c9ddc6554bf869d64412dc787b1b94830a24e47df6a9f30e7 xsa312.patch
+sha256 c69ae21b2ddeaf25532a81a448fcc6a218bc56f93c8907b2d416b2d4339c0afe xen-4.13.0.tar.gz
 sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index d0c6bebe9d..951af963e0 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.12.2
+XEN_VERSION = 4.13.0
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
-XEN_PATCH = \
-	https://xenbits.xenproject.org/xsa/xsa312.patch
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-acpica host-python
