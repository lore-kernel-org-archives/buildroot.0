From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jul 2020 00:09:01 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/iproute2: add
 optional dependencies on libselinux and libcap
Message-ID: <20200705220837.3545984545@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c52a7a09bb5460e78339665f1c54afee61eb6cd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

The configure script will automatically detect used pkg-config if
libcap or libselinux are available.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1b9f6fd03918f5ee00460efdf09422e98789bdbb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iproute2/iproute2.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6d20f65f34..e5841cc460 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -16,6 +16,14 @@ ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 IPROUTE2_DEPENDENCIES += elfutils
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+IPROUTE2_DEPENDENCIES += libcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+IPROUTE2_DEPENDENCIES += libselinux
+endif
+
 ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
 else
