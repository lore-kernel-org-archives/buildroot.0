From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 16:38:59 +0200
Subject: [Buildroot] [git commit] package/jitterentropy-library: fix build
 failure due to missing -fPIC
Message-ID: <20191025143231.27F467FE54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41f06fa0bbe0b0bfeb72e9c701f77e607505cdd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jitterentropy-library needs -fPIC flag to build so add it when building.

Fixes:
http://autobuild.buildroot.net/results/505/5059207ec9ab0b502717626cc84956dafd0c3c32/

[Original: http://patchwork.ozlabs.org/patch/1182068/]
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jitterentropy-library/jitterentropy-library.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 2ea24f83ac..70af24e5db 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -23,7 +23,7 @@ endif
 
 
 define JITTERENTROPY_LIBRARY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 		$(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
 endef
 
