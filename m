From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 14:31:11 +0200
Subject: [Buildroot] [git commit] systemd: fix nogroup
Message-ID: <20180701122755.27108821CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d912e619d48a7dfaed29d490bf389603974cfd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The special 65534 group is named nogroup (not nobody) in buildroot
tell systemd about that

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0d5e348594..10e11a9277 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -43,7 +43,8 @@ SYSTEMD_CONF_OPTS += \
 	-Dkexec-path=/usr/sbin/kexec \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dmount-path=/usr/bin/mount \
-	-Dumount-path=/usr/bin/umount
+	-Dumount-path=/usr/bin/umount \
+	-Dnobody-group=nogroup
 
 # disable unsupported features for non-glibc toolchains
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
