From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:03:52 +0200
Subject: [Buildroot] [git commit] jimtcl: change the way of defining the
	JIMTCL_INSTALL_LIB variable
Message-ID: <20150401211756.8D6F18191A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4c2843fbbd03c88457ae0ca37fb32fa9c80cb48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jimtcl/jimtcl.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 75c0382..c2e04ff 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -32,10 +32,11 @@ JIMTCL_INSTALL_LIB =
 else
 JIMTCL_SHARED = --shared
 JIMTCL_LIB = so.$(JIMTCL_VERSION)
-JIMTCL_INSTALL_LIB = \
+define JIMTCL_INSTALL_LIB
 	$(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) \
-	$(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB); \
+		$(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB)
 	ln -s libjim.$(JIMTCL_LIB) $(TARGET_DIR)/usr/lib/libjim.so
+endef
 endif
 
 define JIMTCL_CONFIGURE_CMDS
