From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 16 Jul 2016 16:06:26 -0400
Subject: [Buildroot] [v2 2/5] package/audit: add support for host variant
In-Reply-To: <1468699589-14328-1-git-send-email-Aduskett@gmail.com>
References: <1468699589-14328-1-git-send-email-Aduskett@gmail.com>
Message-ID: <1468699589-14328-2-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

refpolicy requires host-audit to compile.  This patch adds that support.
As previously discussed, libcap-ng is required as far as I can tell, and
as such, I have made it mandatory to compile it as a dependency.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes:

v1 - v2:
 - Removed frivilous check for libcap-ng
 - made host-libcap-ng mandatory.

 package/audit/audit.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 89fdf14..1300c72 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -58,4 +58,7 @@ define AUDIT_INSTALL_CLEANUP
 endef
 AUDIT_POST_INSTALL_TARGET_HOOKS += AUDIT_INSTALL_CLEANUP
 
+HOST_AUDIT_CONF_OPTS = --without-python --without-python3 --disable-zos-remote --with-libcap-ng=yes
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.7.4
