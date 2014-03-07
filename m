From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 23:38:40 +0100
Subject: [Buildroot] [git commit] package/zic: install header
Message-ID: <20140307223917.62C329BE22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c053979d4e22ec080aecf1911a354616124dcf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The incoming host-tzdump package requires the tzfile header,
so we isntall it.

[Thomas: remove mkdir -p, unneeded because of the use of install -D,
and change install to $(INSTALL), like we do in all other packages.]

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
[yann.morin.1998 at free.fr: split zic header-install to its own cset]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zic/zic.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index c9b6c7b..65605c5 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -20,8 +20,8 @@ define HOST_ZIC_BUILD_CMDS
 endef
 
 define HOST_ZIC_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/usr/sbin
-	install -D -m 755 $(@D)/zic $(HOST_DIR)/usr/sbin/zic
+	$(INSTALL) -D -m 755 $(@D)/zic $(HOST_DIR)/usr/sbin/zic
+	$(INSTALL) -D -m 644 $(@D)/tzfile.h $(HOST_DIR)/usr/include/tzfile.h
 endef
 
 $(eval $(host-generic-package))
