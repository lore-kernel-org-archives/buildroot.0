From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:47:09 +0200
Subject: [Buildroot] [git commit] package/systemd: add fdisk support
Message-ID: <20200412133307.BE0EF8E774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b53987e09e086cdc7e52f81cbea6842aaa3e5709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 78a801926f..296d975a7f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -130,6 +130,12 @@ else
 SYSTEMD_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),y)
+SYSTEMD_CONF_OPTS += -Dfdisk=true
+else
+SYSTEMD_CONF_OPTS += -Dfdisk=false
+endif
+
 ifeq ($(BR2_PACKAGE_VALGRIND),y)
 SYSTEMD_DEPENDENCIES += valgrind
 SYSTEMD_CONF_OPTS += -Dvalgrind=true
