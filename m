From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 10:00:52 +0200
Subject: [Buildroot] [git commit] setools: change sepol library directory
Message-ID: <20171021080214.560B880407@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b91d77892b3b226c02a2af691766407e5fe109a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

setools currently points the libsepol library directory to
$(STAGING_DIR)/lib/ when it should be $(STAGING_DIR)/usr/lib

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/setools/setools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 80d5823..8b93ccf 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -24,7 +24,7 @@ endif
 define SETOOLS_FIX_SETUP
 	# By default, setup.py will look for libsepol.a in the host machines
 	# /usr/lib directory. This needs to be changed to the staging directory.
-	$(SED) "s at base_lib_dirs =.*@base_lib_dirs = ['$(STAGING_DIR)/lib']@g" \
+	$(SED) "s at base_lib_dirs =.*@base_lib_dirs = ['$(STAGING_DIR)/usr/lib']@g" \
 		$(@D)/setup.py
 endef
 SETOOLS_POST_PATCH_HOOKS += SETOOLS_FIX_SETUP
