From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 20:54:01 +0100
Subject: [Buildroot] [git commit] openswan: disable documentation
Message-ID: <20181030201012.BBF7083555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a0c8258b41163006b15ade1d52985ad5dac6618
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable pod2man and xmlto which are used to build man pages

Fixes:
 - http://autobuild.buildroot.org/results/2268814b8f5a071ecec1aab962b50a1edcb818d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
