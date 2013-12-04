From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Dec 2013 22:04:23 +0100
Subject: [Buildroot] [git commit] grub: force -m32 so we build grub 32 bits
	on 64 bits architecture
Message-ID: <20131204210742.9EFDB9BECA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c66baa06cc28c7f9a529d84958716cea9d6fe97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Matthew Weber, Grub doesn't build on 64 bits build
machines, because the host compiler produces 64 bits binaries by
default, while Grub should be built 32 bits. Therefore, this commit
passes -m32 to the Grub CFLAGS, so that 32 bits binaries are always
produced.

Reported-by: Matthew Weber <mlweber1@rockwellcollins.com>
Cc: Matthew Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by:  Matthew Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub/grub.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 6ba02cd..eb066af 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -70,7 +70,7 @@ GRUB_POST_PATCH_HOOKS += GRUB_DEBIAN_PATCHES
 
 GRUB_CONF_ENV = \
 	$(HOST_CONFIGURE_OPTS) \
-	CFLAGS="$(HOST_CFLAGS) $(GRUB_CFLAGS)"
+	CFLAGS="$(HOST_CFLAGS) $(GRUB_CFLAGS) -m32"
 
 GRUB_CONF_OPT = \
 	--disable-auto-linux-mem-opt \
