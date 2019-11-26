From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 12:54:26 +0100
Subject: [Buildroot] [git commit] package/minicom: make default port and
 lock directory fixed defaults
Message-ID: <20191126114646.61AE381590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eeaa4328004dff1a45483bfde1fb80cc03724c0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minicom's configure script will set values for the default port and lock
directory based on the configuration of the host machine, which is not
useful for cross-compiling or reproducible builds, so instead set them
to sensible default values.

Signed-off-by: James Byrne <james.byrne@origamienergy.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minicom/minicom.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 11d69d4d0e..c08e9b10f4 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -22,4 +22,8 @@ define MINICOM_MKDIR_M4
 endef
 MINICOM_POST_PATCH_HOOKS += MINICOM_MKDIR_M4
 
+MINICOM_CONF_OPTS = \
+	--enable-dfl-port=/dev/ttyS1 \
+	--enable-lock-dir=/var/lock
+
 $(eval $(autotools-package))
