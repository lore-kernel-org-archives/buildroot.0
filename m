From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 3 Nov 2020 22:17:55 +0100
Subject: [Buildroot] [git commit] package/systemd: add missing path options
Message-ID: <20201103210517.56EE986D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acb62b3336d961486d8334670572cfb755eef102
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If paths are not set, then meson will search the host system for the
binaries (or the target, where those binaries are not yet installed).
So add the missing paths.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6f04283bdc..50416cceb6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -37,11 +37,15 @@ SYSTEMD_CONF_OPTS += \
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
 	-Didn=true \
 	-Dnss-systemd=true \
 	-Dportabled=false
