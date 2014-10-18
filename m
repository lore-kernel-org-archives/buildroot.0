From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 19:17:07 +0200
Subject: [Buildroot] [git commit] tinyalsa: Fix overwrite of asound.h
Message-ID: <20141018171715.0F501B384B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=debf12f43e908f555d12d0fbbe2cbbcb42617fd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As stated by Maarten ter Huurne on the mailing list, the install of the
asound.h headers overwrite the one from the toolchains or kernel
headers.
Since tinyals's header is only a subset of the 'real' asound.h, there is
no need to overwrite it.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Maarten ter Huurne <maarten@treewalker.org>
Cc: Thomas Petazzoni  <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinyalsa/tinyalsa.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index b287e78..48288f1 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -16,8 +16,6 @@ endef
 define TINYALSA_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libtinyalsa.so \
 			$(STAGING_DIR)/usr/lib/libtinyalsa.so
-	$(INSTALL) -D -m 0644 $(@D)/include/sound/asound.h \
-			$(STAGING_DIR)/usr/include/sound/asound.h
 	$(INSTALL) -D -m 0644 $(@D)/include/tinyalsa/asoundlib.h \
 			$(STAGING_DIR)/usr/include/tinyalsa/asoundlib.h
 endef
