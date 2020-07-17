From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 18 Jul 2020 01:43:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: remove SysV and utmp
 compatibility feature
Message-ID: <20200717234312.17995-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd enabled compatibility with SysV services and utmp
by default, none of which is needed for buildroot as the packages
will install only the files for the chosen init system.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:
-   Just disable those options as implied by Thomas Petazzoni
---
 package/systemd/systemd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9ca9b8ae0a..f1795f476f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -22,6 +22,9 @@ SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
 	-Drootlibdir='/usr/lib' \
+	-Dsysvinit-path= \
+	-Dsysvrcnd-path= \
+	-Dutmp=false \
 	-Dblkid=true \
 	-Dman=false \
 	-Dima=false \
-- 
2.27.0
