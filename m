From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 16 May 2015 01:06:28 +0200
Subject: [Buildroot] [PATCH] package/ipmiutil: really force md2 off
Message-ID: <1431731188-23565-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If ALLOW_GNU is not defined, SKIP_MD2 is a nop.

Fixes:
http://autobuild.buildroot.net/results/f606ec1fff4cea257a4c6274bc5603efdfc439ad/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ipmiutil/ipmiutil.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.9.3
