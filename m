From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:30:01 +0100
Subject: [Buildroot] [git commit] ebtables: add error handling to for loop
Message-ID: <20141201223450.97E8780048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93776d30fc921c959b6d9bd11e32bd51704f0e46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ebtables/ebtables.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 578c3ae..23c4628 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -28,7 +28,7 @@ define EBTABLES_INSTALL_TARGET_CMDS
 		$(@D)/$(EBTABLES_SUBDIR)/extensions/*.so; \
 		do \
 		$(INSTALL) -m 0755 -D $${so} \
-			$(TARGET_DIR)/lib/ebtables/`basename $${so}`; \
+			$(TARGET_DIR)/lib/ebtables/`basename $${so}` || exit 1; \
 	done
 	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
 		$(TARGET_DIR)/sbin/ebtables
