From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 22:12:33 +0200
Subject: [Buildroot] [git commit] noip: use a simpler sed command with our
	$(SED) variable
Message-ID: <20151021201411.DB66981E90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ade3ed68169b72bf22970a23951a534fe00825b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/noip/noip.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index fceea1e..98edfca 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -11,8 +11,7 @@ NOIP_LICENSE = GPLv2+
 NOIP_LICENSE_FILES = COPYING
 
 define NOIP_BUILD_CMDS
-	sed -i -e "s:\(#define CONFIG_FILENAME\).*:\1 \"/etc/no-ip2.conf\":" \
-		$(@D)/noip2.c
+	$(SED) "/^#define CONFIG_FILENAME/ s/PREFIX//" $(@D)/noip2.c
 	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		PREFIX=/usr CONFDIR=/etc
 endef
