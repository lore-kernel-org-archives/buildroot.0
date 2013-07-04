From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Jul 2013 13:30:52 +0200
Subject: [Buildroot] [git commit] linux-headers: switch to xz format
Message-ID: <20130704113254.EF4AC90AF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c39a2e1d6cfa62a8e68f8b10a7d61ccb6e493959
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The headers and kernels where changed to XZ format on commit
98b5cc3eb4d4103b2149325b98a5e93e68c68dd8, but the headers reverted back
to bz2 on the packaging of the toolchain.
This causes double kernel downloads when the versions match, so switch
back the headers to XZ.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-headers/linux-headers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 9d7a683..30d3076 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -13,7 +13,7 @@ LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
 else
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
 endif
-LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.bz2
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
