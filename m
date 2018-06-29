From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat, 30 Jun 2018 00:25:52 +0200
Subject: [Buildroot] [PATCH 3/3] systemd: fix nogroup
In-Reply-To: <20180629222552.12808-1-jeremy.rosen@smile.fr>
References: <20180629222552.12808-1-jeremy.rosen@smile.fr>
Message-ID: <20180629222552.12808-4-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The special 65534 group is named nogroup (not nobody) in buildroot
tell systemd about that

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
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
-- 
2.18.0
