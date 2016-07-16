From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 22:47:58 +0200
Subject: [Buildroot] [git commit] package/audit: add support for host variant
Message-ID: <20160716205214.AA7217FCC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2f7b6e196caefa2ece7c19b2cd5401be697a2c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-libsemanage requires host-audit to compile, therefore this patch
adds a host variant for the audit package.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Thomas: remove libcap-ng usage for now, rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/audit/audit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 89fdf14..06ec959 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -58,4 +58,11 @@ define AUDIT_INSTALL_CLEANUP
 endef
 AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_CLEANUP
 
+HOST_AUDIT_CONF_OPTS = \
+	--without-python \
+	--without-python3 \
+	--disable-zos-remote \
+	--without-libcap-ng
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
