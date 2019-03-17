From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2019 14:07:32 +0100
Subject: [Buildroot] [PATCH] package/systemd: drop optiopns that are now
 conditional
Message-ID: <20190317130732.10994-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 6f28ce53222 (package/systemd: enable building of systemd-boot)
made the efi and gnu-efi optiona conditional upon whether systemd-boot
is built or not, but forgot to remove the non-conditional ones.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5389b7ae3a..edc4a9ecc1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -24,8 +24,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dblkid=true \
 	-Dman=false \
 	-Dima=false \
-	-Defi=false \
-	-Dgnu-efi=false \
 	-Dlibcryptsetup=false \
 	-Dldconfig=false \
 	-Ddefault-dnssec=no \
-- 
2.14.1
