From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:10:11 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] systemd: fix nogroup
Message-ID: <20180719100635.58C3E88E7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5ab04d38e158663ff68e96eabc19216d97b08a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The special 65534 group is named nogroup (not nobody) in buildroot
tell systemd about that

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9d912e619d48a7dfaed29d490bf389603974cfd2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9600fe9eb0..8ab0f6f370 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -48,7 +48,8 @@ SYSTEMD_CONF_OPTS += \
 	-Dkexec-path=/usr/sbin/kexec \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dmount-path=/usr/bin/mount \
-	-Dumount-path=/usr/bin/umount
+	-Dumount-path=/usr/bin/umount \
+	-Dnobody-group=nogroup
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
