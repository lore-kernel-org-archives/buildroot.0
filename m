From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:43 -0000
Subject: [Buildroot] [git commit] package/Makefile.in: Add missing options
 to LDFLAGS for full RELRO build
Message-ID: <20180907111448.BD663815AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01d8a0a9455f9408819d7f135fba5139f0672507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The options for a full RELRO build should also be added to LDFLAGS.

Originally submitted as
http://patchwork.ozlabs.org/patch/904034/

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 5e0ff8c841..14b3bbd243 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -159,7 +159,7 @@ TARGET_HARDENED += $(TARGET_CFLAGS_RELRO)
 TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
 else ifeq ($(BR2_RELRO_FULL),y)
 TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
-TARGET_LDFLAGS += -pie
+TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)
 endif
 
 ifeq ($(BR2_FORTIFY_SOURCE_1),y)
