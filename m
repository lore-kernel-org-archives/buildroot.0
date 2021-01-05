From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 23:08:40 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/syslog-ng: don't
 fail if systemd service directory already exists
Message-ID: <20210105220828.9C2E681383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=954ba08d1d4b2fcbe011a662ec483b1d90277581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Add -p argument that ignore that specified directory already exists.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[yann.morin.1998 at free.fr:
  - split to its own patch
  - rewrite commit title
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d2d629ecd8041a21b6c615e221137113837a42c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/syslog-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index ed8f0c7120..87e41c11f9 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -113,7 +113,7 @@ endef
 # By default syslog-ng installs a .service that requires a config file at
 # /etc/default, so provide one with the default values.
 define SYSLOG_NG_INSTALL_INIT_SYSTEMD
-	mkdir $(TARGET_DIR)/usr/lib/systemd/system/syslog-ng at .service.d
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/syslog-ng at .service.d
 	printf '[Install]\nDefaultInstance=default\n' \
 		>$(TARGET_DIR)/usr/lib/systemd/system/syslog-ng at .service.d/buildroot-default-instance.conf
 endef
