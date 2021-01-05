From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 23:08:28 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/syslog-ng: don't
 fail if systemd service directory already exists
Message-ID: <20210105220834.6DC5086258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=339b146c55ef26506cd6c4764cb26f78de6878bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

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
index 7c2368efba..f7182ba311 100644
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
