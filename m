From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Mon, 10 Aug 2020 08:43:32 +0000
Subject: [Buildroot] [PATCH 1/1] package/rauc: fix build with c99 and above
 compilers
Message-ID: <77h6nf0oxQxZiMllMN73fCQn07DZqLnfhClIcPrhY3sjad303S0Z8W77XaYAFCT1IbAbZFAPgX2jt2xAfCkecSZscDO0xAZCebaQFOMkbAc=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- fix build inline functions
- fix signature path

Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 51f37f6cb8..d327122293 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,4 +1,4 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v1.3/rauc-1.4.tar.xz.asc
+# https://github.com/rauc/rauc/releases/download/v1.4/rauc-1.4.tar.xz.asc
 sha256  85aabf214cd93a37f7ad0b3aaad89eb94facf0f3ebf6e2edca945acbca9b0967  rauc-1.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 1915c783aa..553467f618 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -30,6 +30,8 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 RAUC_DEPENDENCIES += systemd
 endif

+RAUC_CFLAGS += -fgnu89-inline
+
 define RAUC_INSTALL_INIT_SYSTEMD
 	mkdir $(TARGET_DIR)/usr/lib/systemd/system/rauc.service.d
 	printf '[Install]\nWantedBy=multi-user.target\n' \
--
2.20.1
