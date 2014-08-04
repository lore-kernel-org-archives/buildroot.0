From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:27:12 +0200
Subject: [Buildroot] [git commit] samba: Remove execution rights from
	smb.conf
Message-ID: <20140804182821.1D6A99D3A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74270de8bcb21dc06428a56f0b91b6835aa8fccf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/etc/samba/smb.conf should be installed without execution rights since it is a
simple text configuration file.

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/samba.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 6d379b5..84e525f 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -167,7 +167,7 @@ define SAMBA_INSTALL_INITSCRIPTS_CONFIG
 	fi
 	# install config
 	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
-		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
+		$(INSTALL) -m 0644 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
 	fi
 endef
 
