From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jul 2020 00:10:45 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/iproute2: add
 optional dependencies on libselinux and libcap
Message-ID: <20200705220831.EB0C98402B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5a16dc6297a08c91569f0a1a3b0cfff6eb898cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
index a2e2d25d81..7268497135 100644
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
