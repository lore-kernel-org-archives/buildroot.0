From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 09:45:40 +0100
Subject: [Buildroot] [git commit] bdwgc: fix _ARCH_SUPPORTS kconfig warning
Message-ID: <20141203084644.9903A80097@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2ba4b31b36a95f27c078165d118a37b57deefd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have to define it as a bool, otherwise kconfig complains with:

package/bdwgc/Config.in:1:warning: config symbol defined without type

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bdwgc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
index 215c54d..ec83fa3 100644
--- a/package/bdwgc/Config.in
+++ b/package/bdwgc/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_BDWGC_ARCH_SUPPORTS
+	bool
 	default y
 	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_i386 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_sh \
