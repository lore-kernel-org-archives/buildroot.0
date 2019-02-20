From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 20 Feb 2019 21:33:57 +0100
Subject: [Buildroot] [git commit] package/ipmiutil: fix build with openssl
 1.1.x
Message-ID: <20190220203312.CE46A8B6EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=623afa9c0cd5d25c51cbf78214fbd98e5ef704ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/1d868798c5b80d7b41123f988449ef548dd95490

This works for libressl as well, because libressl does provide
EVP_CIPHER_CTX_new() which is what gets enabled by -DSSL11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ipmiutil/ipmiutil.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 5d8c45665d..0d9a4509b3 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -18,7 +18,7 @@ ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
 # SKIP_MD2 can be used only if ALLOW_GNU is defined.
-IPMIUTIL_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DALLOW_GNU -DSKIP_MD2"
+IPMIUTIL_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DALLOW_GNU -DSKIP_MD2 -DSSL11"
 IPMIUTIL_DEPENDENCIES += openssl
 else
 IPMIUTIL_CONF_OPTS += --disable-lanplus
