From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] liblockfile: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132039.6B56480335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d2103d6e87f59cb9b48a7e7a8af895b2a5a3350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liblockfile/liblockfile.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 8de598f..e42b830 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -18,7 +18,7 @@ LIBLOCKFILE_CONF_OPTS = --mandir=/usr/share/man
 define LIBLOCKFILE_INSTALL_STAGING_CMDS
 	mkdir -p $(addprefix $(STAGING_DIR)/usr/share/man/man,1 3)
 	rm -f $(STAGING_DIR)/usr/lib/liblockfile.so
-	$(MAKE) -C $(LIBLOCKFILE_DIR) ROOT=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LIBLOCKFILE_DIR) ROOT=$(STAGING_DIR) install
 	ln -sf liblockfile.so $(STAGING_DIR)/usr/lib/liblockfile.so.1
 endef
 
