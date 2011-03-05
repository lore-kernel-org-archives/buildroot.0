From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Mar 2011 15:04:44 +0100
Subject: [Buildroot] [git commit master 1/1] xz: fix build without wchar
	support
Message-ID: <20110305141529.C7BF98E322@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8296cf6c7ffa920ee9d37ac4695d52966fd1ecff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xz itself works without wchar support, but the C99 test in configure
fails when it isn't available. Fix it by providing a cached value for
the test.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xz/xz.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 2da8fcb..dfc0638 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -7,6 +7,7 @@ XZ_VERSION = 5.0.0
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
+XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 $(eval $(call AUTOTARGETS,package,xz))
 $(eval $(call AUTOTARGETS,package,xz,host))
-- 
1.7.3.4
