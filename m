From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 23:03:48 +0200
Subject: [Buildroot] [PATCH v5 8/9] package/rpi-userland: include
	TARGET_CFLAGS to the overloaded CFLAGS
In-Reply-To: <20161015210349.29432-1-s.martin49@gmail.com>
References: <20161015210349.29432-1-s.martin49@gmail.com>
Message-ID: <20161015210349.29432-9-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
changes v4->v5:
- none

changes v3->v4:
- fix commit subject
- update A/R/T tags

changes v2->v3:
- new patch
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
 
-- 
2.10.0
