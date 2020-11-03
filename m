From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 3 Nov 2020 22:17:55 +0100
Subject: [Buildroot] [git commit] systemd: sort SYSTEMD_CONF_OPTS
Message-ID: <20201103210517.6E23986D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15b4d396b9431634d339dde61cb1d52dcf9e0746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The meson options were in some semi-sorted order with no logic in it.
Sort them alphabetically instead.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 63885993db..cb12f667d6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -23,32 +23,32 @@ SYSTEMD_SELINUX_MODULES = systemd udev
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
-	-Drootlibdir='/usr/lib' \
-	-Dsysvinit-path= \
-	-Dsysvrcnd-path= \
-	-Dutmp=false \
-	-Dman=false \
+	-Ddefault-hierarchy=hybrid \
+	-Didn=true \
 	-Dima=false \
+	-Dkexec-path=/usr/sbin/kexec \
+	-Dkmod-path=/usr/bin/kmod \
 	-Dldconfig=false \
-	-Ddefault-hierarchy=hybrid \
-	-Dtests=false \
+	-Dloadkeys-path=/usr/bin/loadkeys \
+	-Dman=false \
+	-Dmount-path=/usr/bin/mount \
+	-Dnss-systemd=true \
+	-Dportabled=false \
+	-Dquotacheck-path=/usr/sbin/quotacheck \
+	-Dquotaon-path=/usr/sbin/quotaon \
+	-Drootlibdir='/usr/lib' \
+	-Dsetfont-path=/usr/bin/setfont \
 	-Dsplit-bin=true \
 	-Dsplit-usr=false \
-	-Dsystem-uid-max=999 \
+	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dsystem-gid-max=999 \
+	-Dsystem-uid-max=999 \
+	-Dsysvinit-path= \
+	-Dsysvrcnd-path= \
 	-Dtelinit-path= \
-	-Dquotaon-path=/usr/sbin/quotaon \
-	-Dquotacheck-path=/usr/sbin/quotacheck \
-	-Dkmod-path=/usr/bin/kmod \
-	-Dkexec-path=/usr/sbin/kexec \
-	-Dsulogin-path=/usr/sbin/sulogin \
-	-Dmount-path=/usr/bin/mount \
+	-Dtests=false \
 	-Dumount-path=/usr/bin/umount \
-	-Dloadkeys-path=/usr/bin/loadkeys \
-	-Dsetfont-path=/usr/bin/setfont \
-	-Didn=true \
-	-Dnss-systemd=true \
-	-Dportabled=false
+	-Dutmp=false
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
