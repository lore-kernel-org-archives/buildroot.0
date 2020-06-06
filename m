From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 21:34:59 +0200
Subject: [Buildroot] [git commit] package/iproute2: add optional
 dependencies on libselinux and libcap
Message-ID: <20200606193443.DB3E782AA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b9f6fd03918f5ee00460efdf09422e98789bdbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script will automatically detect used pkg-config if
libcap or libselinux are available.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
