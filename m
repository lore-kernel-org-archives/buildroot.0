From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 10:52:39 +0200
Subject: [Buildroot] [git commit] package/systemd: select SELinux modules
Message-ID: <20200904123951.A70B987D6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5704f2ec8f923669a45363efe5fcc4ad6e9559a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select the systemd and udev SELinux modules so that they will be
compiled in the refpolicy. This way, if an SELinux policy is generated,
Systemd will be supported.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 12eb5653f6..c132f36663 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -18,6 +18,8 @@ SYSTEMD_DEPENDENCIES = \
 	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
 
+SYSTEMD_SELINUX_MODULES = systemd udev
+
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
