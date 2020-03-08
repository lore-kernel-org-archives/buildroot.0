From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 22:27:33 +0100
Subject: [Buildroot] [git commit branch/next] package/bearssl: fix
 BR2_SHARED_STATIC_LIBS case
Message-ID: <20200308211524.7234F8FF8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a0443e9b443df37c5a595cb4d3e57cd0fb5d9a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bearssl/bearssl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bearssl/bearssl.mk b/package/bearssl/bearssl.mk
index 549b000916..e85626153c 100644
--- a/package/bearssl/bearssl.mk
+++ b/package/bearssl/bearssl.mk
@@ -15,11 +15,11 @@ BEARSSL_MAKE_OPTS = \
 	LDDLL=$(TARGET_CC)
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-BEARSSL_TARGETS = dll
+BEARSSL_TARGETS += dll
 endif
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-BEARSSL_TARGETS = lib
+BEARSSL_TARGETS += lib
 endif
 
 define BEARSSL_BUILD_CMDS
