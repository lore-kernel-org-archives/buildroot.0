From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 20:04:04 +0200
Subject: [Buildroot] [git commit] package/zstd: Install tools into /usr/bin,
	not /usr/local/bin
Message-ID: <20170920175711.991F380F7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2753d6df3a335545c94c452dafc6f4d82ae7beb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install tools into /usr/bin, not /usr/local/bin, since /usr/local/bin
is not in PATH by deafault.

[Peter: set PREFIX to /usr to really install into /usr/bin]
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zstd/zstd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 475079d..e836a81 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -43,7 +43,7 @@ endef
 
 define ZSTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
 endef
 
 $(eval $(generic-package))
