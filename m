From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 23:03:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng: Fix musl build
Message-ID: <1453586622-21700-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ported from
http://git.alpinelinux.org/cgit/aports/tree/main/iptraf-ng/APKBUILD#n28

Fixes
http://autobuild.buildroot.net/results/72b/72b019ce5bb52b8b87d92cce675708f7b9f8a96e/
http://autobuild.buildroot.net/results/f67/f67f1c2a627a6d535dd5c00e2ee131b5c5a99a0a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iptraf-ng/iptraf-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
index 7313873..404db8b 100644
--- a/package/iptraf-ng/iptraf-ng.mk
+++ b/package/iptraf-ng/iptraf-ng.mk
@@ -11,5 +11,6 @@ IPTRAF_NG_LICENSE_FILES = LICENSE
 IPTRAF_NG_DEPENDENCIES = ncurses
 
 IPTRAF_NG_MAKE_ENV = NCURSES_LDFLAGS="-lpanel -lncurses"
+IPTRAF_NG_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 $(eval $(autotools-package))
-- 
2.7.0.rc3
