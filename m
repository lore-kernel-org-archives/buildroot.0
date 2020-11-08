From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Nov 2020 18:49:45 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/systemd: add
 missing path options
Message-ID: <20201108180657.146DB8792B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8636f93e7a72fd896eaf860695954ac55e81639
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

If paths are not set, then meson will search the host system for the
binaries (or the target, where those binaries are not yet installed).
So add the missing paths.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit acb62b3336d961486d8334670572cfb755eef102)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c01e8c9a3e..48c151fb34 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -34,11 +34,15 @@ SYSTEMD_CONF_OPTS += \
 	-Dsystem-uid-max=999 \
 	-Dsystem-gid-max=999 \
 	-Dtelinit-path=$(TARGET_DIR)/sbin/telinit \
+	-Dquotaon-path=/usr/sbin/quotaon \
+	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dkmod-path=/usr/bin/kmod \
 	-Dkexec-path=/usr/sbin/kexec \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dmount-path=/usr/bin/mount \
 	-Dumount-path=/usr/bin/umount \
+	-Dloadkeys-path=/usr/bin/loadkeys \
+	-Dsetfont-path=/usr/bin/setfont \
 	-Dnobody-group=nogroup \
 	-Didn=true \
 	-Dnss-systemd=true
