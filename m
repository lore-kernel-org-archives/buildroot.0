From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 21:51:51 +0200
Subject: [Buildroot] [git commit] package/dropbear: fix license infos
Message-ID: <20200629195156.3D2098612F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08f2f05bb2f272a7ca67d57a6c9c8f027f4a0fb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this package allows to use optionally bundled libraries (which is exceptional in BR).
so, license infos must be conditional.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dropbear/dropbear.hash | 2 ++
 package/dropbear/dropbear.mk   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index ab53197f32..39a116edea 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -3,3 +3,5 @@ sha256  084f00546b1610a3422a0773e2c04cbe1a220d984209e033b548b49f379cc441  dropbe
 
 # License file, locally computed
 sha256  2ac2be75a2232ec2473070dd791ee990253dffde6022d364809bbbcbc30f710e  LICENSE
+sha256  8f196cb13afd271f5e267fd29543fc454596382ad580e7592709492843996ac8  libtomcrypt/LICENSE
+sha256  2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  libtommath/LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index b7342cef51..bca79da45a 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -79,6 +79,8 @@ DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
 endif
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
+DROPBEAR_LICENSE +=, Unlicense, WTFPL
+DROPBEAR_LICENSE_FILES += libtommath/LICENSE libtomcrypt/LICENSE
 DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
 else
 define DROPBEAR_BUILD_FEATURED
