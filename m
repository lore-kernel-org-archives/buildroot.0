From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 10:02:32 +0200
Subject: [Buildroot] [git commit] package/iputils: create ping6 symlink
Message-ID: <20190622080502.C81A181677@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b37dda2a972cdfb0bc792871917fd257f18c7d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream expect distros will do it, see
https://github.com/iputils/iputils/commit/ebad35fee3de851b809c7b72ccc654a72b6af61d

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iputils/iputils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index c6bff92848..15ee68be53 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -65,6 +65,12 @@ define IPUTILS_MOVE_BINARIES
 endef
 IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_MOVE_BINARIES
 
+# upstream requires distros to create symlink
+define IPUTILS_CREATE_PING6_SYMLINK
+	ln -sf $(TARGET_DIR)/bin/ping $(TARGET_DIR)/bin/ping6
+endef
+IPUTILS_POST_INSTALL_TARGET_HOOKS += IPUTILS_CREATE_PING6_SYMLINK
+
 # handle permissions ourselves
 IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
 define IPUTILS_PERMISSIONS
