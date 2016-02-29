From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:44:43 +0100
Subject: [Buildroot] [git commit] package/systemd: add --enable/disable-bzip2
Message-ID: <20160302202759.435E47FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22c571c7857a9e582e48ceceb20d1f50339c7848
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9f2dc51..3dffbc9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -80,6 +80,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-kdbus
 endif
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+SYSTEMD_DEPENDENCIES += bzip2
+SYSTEMD_CONF_OPTS += --enable-bzip2
+else
+SYSTEMD_CONF_OPTS += --disable-bzip2
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 SYSTEMD_DEPENDENCIES += xz
 SYSTEMD_CONF_OPTS += --enable-xz
