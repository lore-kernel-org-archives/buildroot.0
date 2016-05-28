From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 19:22:14 +0200
Subject: [Buildroot] [git commit] mbedtls: fix companion programs static
	build
Message-ID: <20160528172239.7A73180AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=115e5ae9c90e5dfe83adc751e5353695f7ac5cd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set LINK_WITH_PTHREAD to explicitly add pthread to the list of libraries.

Fixes:
http://autobuild.buildroot.net/results/e08/e087dfa2a6057b18209cd6adff2760026a9ca1db/
http://autobuild.buildroot.net/results/615/61565f1a88b7d6eea03a355ccf8dd3fe6585c4ab/
http://autobuild.buildroot.net/results/6b2/6b267b9cba37655e7d8e6d78821f96d9a8dd7d2e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mbedtls/mbedtls.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index fe166e2..994a3f4 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -23,6 +23,9 @@ define MBEDTLS_ENABLE_THREADING
 		$(@D)/include/mbedtls/config.h
 endef
 MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_THREADING
+ifeq ($(BR2_STATIC_LIBS),y)
+MBEDTLS_CONF_OPTS += -DLINK_WITH_PTHREAD=ON
+endif
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
