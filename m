From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:22:15 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: include
	TARGET_CFLAGS to the overloaded CFLAGS
Message-ID: <20161022144115.B5EDB819CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e84b9003d8259472f9c79b385443b1b4975203e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-userland/rpi-userland.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 86cde87..4a6eb41 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -10,7 +10,8 @@ RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
 RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr \
-	-DCMAKE_C_FLAGS="-DVCFILED_LOCKFILE=\\\"/var/run/vcfiled.pid\\\""
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) \
+		-DVCFILED_LOCKFILE=\\\"/var/run/vcfiled.pid\\\""
 
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
