From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 13 Jan 2020 13:25:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: also fix RPATH for host
 journalctl
Message-ID: <20200113122555.242539-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows for example to prebuild catalogs on
readonly filesystems:
journalctl --root=$TARGETPATH --update-catalog

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 791e770ca1..442803baa8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -572,7 +572,8 @@ HOST_SYSTEMD_HOST_TOOLS = \
 	systemd-analyze \
 	systemd-mount \
 	systemctl \
-	udevadm
+	udevadm \
+	journalctl
 
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
-- 
2.24.1
