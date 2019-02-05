From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 15:37:05 +0100
Subject: [Buildroot] [git commit] package/mender: fixing init script naming
Message-ID: <20190205143909.AA26181213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=097e85abfca75179a4bd889997ff3d9458af2fb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f88947c2fe2d (package/mender: adding systemv init file) added an init
script, but the installation logic referred to S04mender instead of S42mender.

Update the installation logic to match the file name.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Peter: expand commit message description]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/mender.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 0d719382f8..ae5bcb8101 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -70,8 +70,8 @@ define MENDER_INSTALL_INIT_SYSTEMD
 endef
 
 define MENDER_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/mender/S04mender \
-		$(TARGET_DIR)/etc/init.d/S04mender
+	$(INSTALL) -D -m 755 package/mender/S42mender \
+		$(TARGET_DIR)/etc/init.d/S42mender
 endef
 
 $(eval $(golang-package))
