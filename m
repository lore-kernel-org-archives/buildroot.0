From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:35:54 +0200
Subject: [Buildroot] [git commit] package/makedumpfile: fix passing of
 MAKEDUMPFILE_MAKE_OPTS
Message-ID: <20200919123954.147C182877@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=660692939cf6bd13fd0c822083f1fd4b0fafca1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MAKEDUMP_MAKE_OPTS contains an important option to enable LZO support,
but it was not passed at build time.

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/makedumpfile/makedumpfile.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 8077664892..276f3f908c 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -24,7 +24,7 @@ endif
 
 define MAKEDUMPFILE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		TARGET=$(MAKEDUMPFILE_TARGET) LINKTYPE=dynamic
+		$(MAKEDUMPFILE_MAKE_OPTS) TARGET=$(MAKEDUMPFILE_TARGET) LINKTYPE=dynamic
 endef
 
 define MAKEDUMPFILE_INSTALL_TARGET_CMDS
