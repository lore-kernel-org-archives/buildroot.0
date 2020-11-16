From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 15:45:23 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/rauc: prevent
 occurring the error when directory exists
Message-ID: <20201116143543.1B52083493@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d18c7bd1908a92ca7c81fde6e2eea6751cdd0a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Add -p argument that ignore that specified directory already exists.

Fixes:
 mkdir: cannot create directory ???/home/bartekk/buildroot-2020.11-rc1/output/target/usr/lib/systemd/system/rauc.service.d???: File exists

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fefdd0511e99676aceb09403063f336e631d5067)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/rauc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 1915c783aa..61c50ab316 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -31,7 +31,7 @@ RAUC_DEPENDENCIES += systemd
 endif
 
 define RAUC_INSTALL_INIT_SYSTEMD
-	mkdir $(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d
+	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d
 	printf '[Install]\nWantedBy=multi-user.target\n' \
 		>$(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d/buildroot-enable.conf
 endef
