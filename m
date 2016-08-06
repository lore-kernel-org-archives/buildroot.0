From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Aug 2016 14:44:18 +0200
Subject: [Buildroot] [PATCH] package/lttng-libust: fix build with musl
Message-ID: <1470487458-29015-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport two patches from upstream to fix build with musl.

Fixes:
    http://autobuild.buildroot.org/results/dcb/dcb6c3aadf6f955016cf3c3f9b917cbec6d29342/
    http://autobuild.buildroot.org/results/deb/deb80eea5ceae3e7f8e0549596dce2fb6a1e7596/
    http://autobuild.buildroot.org/results/91e/91e64477864825c39911e3f3d0a2459f2987c209/
    [...and a lot more...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/lttng-libust/lttng-libust.hash | 4 ++++
 package/lttng-libust/lttng-libust.mk   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 57c7e00..1494acf 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,2 +1,6 @@
 # http://www.lttng.org/files/lttng-ust/lttng-ust-2.7.1.tar.bz2.sha1
 sha1  597ebecb885debb58c263de57f30b1096d4eefc6  lttng-ust-2.7.1.tar.bz2
+
+# Locally computed
+sha1  2e79c98e458b2e052930fb81441e6ca8377a2ed7 787364e8bac9a146f9d65c763633c2b75eb76463.patch
+sha1  cf77ec415111f77573be7917d9b62d8e49dc6304 30307a67b48641875b122d8f832bbfb454e95d92.patch
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 4a65057..61ffed4 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -10,6 +10,10 @@ LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1, MIT (system headers), GPLv2 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 
+LTTNG_LIBUST_PATCH = \
+	https://github.com/lttng/lttng-ust/commit/787364e8bac9a146f9d65c763633c2b75eb76463.patch \
+	https://github.com/lttng/lttng-ust/commit/30307a67b48641875b122d8f832bbfb454e95d92.patch
+
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 
-- 
2.7.4
