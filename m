From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 00:03:32 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] openswan: disable
 documentation
Message-ID: <20181113230115.0DE8C82DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3610e1f0233650129f0ad84fc4ff39fd41677d3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Disable pod2man and xmlto which are used to build man pages

Fixes:
 - http://autobuild.buildroot.org/results/2268814b8f5a071ecec1aab962b50a1edcb818d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8a0c8258b41163006b15ade1d52985ad5dac6618)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openswan/openswan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 928eb9bb6f..e41bc4df80 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -10,7 +10,7 @@ OPENSWAN_LICENSE = GPL-2.0+, BSD-3-Clause
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
 OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
-OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
+OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" POD2MAN="" XMLTO="" \
 	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false
