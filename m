From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 May 2020 18:24:59 +0200
Subject: [Buildroot] [git commit] package/libssh2: fix autoreconf comment
Message-ID: <20200516160915.7298984539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dccd3b24805dc39c014c7c9e86e10eca2147fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment explaining the autoreconf says that we are building from a git
clone - but we are not, currently.  However, the reconf is still needed due
to patches modifying ac files.

This commit corrects the comment.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
[yann.morin.1998 at free.fr: also mention acincludes.m4]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libssh2/libssh2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 3819c1aa31..c03fe0db55 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -14,7 +14,7 @@ LIBSSH2_CONF_OPTS = --disable-examples-build
 # 0003-packet-c-improve-message-parsing.patch
 LIBSSH2_IGNORE_CVES += CVE-2019-17498
 
-# building from a git clone
+# patch touching configure.ac and acinclude.m4
 LIBSSH2_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
