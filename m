From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:12:16 +0200
Subject: [Buildroot] [git commit] package/netatalk: requires CAST and DES
 support in openssl
Message-ID: <20210612115005.818438368E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca86f8f35100fefbb1fbcb461f9dcab7d44764df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable CAST and DES in openssl to fix build failures raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/b7347e3e4b828901dcb954f7cc37b712b80ac49b
 - http://autobuild.buildroot.org/results/453c10ff24ef48f1340ec91412e504fe604033cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - move the 'select' of the options closer to the 'select' on openssl
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netatalk/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index 1560a18747..225d5891c7 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_NETATALK
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
