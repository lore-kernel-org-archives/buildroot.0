From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 15:14:48 +0200
Subject: [Buildroot] [git commit] package/ipmiutil: really force md2 off
Message-ID: <20150516131800.2A3D97FD9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25e15fd17fa51a79b40159629dea1eea7b5f8d96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If ALLOW_GNU is not defined, SKIP_MD2 is a nop.

Fixes:
http://autobuild.buildroot.net/results/f606ec1fff4cea257a4c6274bc5603efdfc439ad/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipmiutil/ipmiutil.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index c3d791c..c7a8dd8 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -12,7 +12,8 @@ IPMIUTIL_LICENSE_FILES = COPYING
 IPMIUTIL_AUTORECONF = YES
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
-IPMIUTIL_CONF_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS) -DSKIP_MD2"
+# SKIP_MD2 can be used only if ALLOW_GNU is defined.
+IPMIUTIL_CONF_OPTS = CPPFLAGS="$(TARGET_CPPFLAGS) -DALLOW_GNU -DSKIP_MD2"
 IPMIUTIL_DEPENDENCIES = openssl
 
 $(eval $(autotools-package))
