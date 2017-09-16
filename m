From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 15 Sep 2017 17:27:12 -0700
Subject: [Buildroot] [PATCH] package/zstd: Install tools into /usr/bin,
	not /usr/local/bin
Message-ID: <20170916002712.19851-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install tools into /usr/bin, not /usr/local/bin, since /usr/local/bin
is not in PATH by deafault.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

 package/zstd/zstd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 475079dbfe..9a6e286954 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -43,7 +43,7 @@ endef
 
 define ZSTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
+		DESTDIR=$(TARGET_DIR) PREFIX= -C $(@D)/programs install
 endef
 
 $(eval $(generic-package))
-- 
2.13.5
