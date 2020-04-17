From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:10:27 +0200
Subject: [Buildroot] [git commit] package/libssh: add patch to fix reported
 version
Message-ID: <20200417195611.5E3398EF9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7db921da5ac57e29efeb1ac37c131d589d12664
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The released libssh package does wrongly reports the previous version.
This patch fixes the version field in the lib.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-libssh.h-bump-to-version-0.9.4.patch      | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch b/package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch
new file mode 100644
index 0000000000..d6ec50509e
--- /dev/null
+++ b/package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch
@@ -0,0 +1,29 @@
+From 8d8428cbbc2c00d078cfbc967e4e6fee7ff7bf0b Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Wed, 15 Apr 2020 11:57:29 +0200
+Subject: [PATCH] libssh.h: bump to version 0.9.4
+
+In the released version of libssh the version bump was not done
+properly. Therefore the current release 0.9.4 reports 0.9.3.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ include/libssh/libssh.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/libssh/libssh.h b/include/libssh/libssh.h
+index 79030131..e2a8d991 100644
+--- a/include/libssh/libssh.h
++++ b/include/libssh/libssh.h
+@@ -79,7 +79,7 @@
+ /* libssh version */
+ #define LIBSSH_VERSION_MAJOR  0
+ #define LIBSSH_VERSION_MINOR  9
+-#define LIBSSH_VERSION_MICRO  3
++#define LIBSSH_VERSION_MICRO  4
+ 
+ #define LIBSSH_VERSION_INT SSH_VERSION_INT(LIBSSH_VERSION_MAJOR, \
+                                            LIBSSH_VERSION_MINOR, \
+-- 
+2.20.1
+
