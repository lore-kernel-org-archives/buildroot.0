From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 15:46:52 +0200
Subject: [Buildroot] [git commit] vtun: fix gcc5 build
Message-ID: <20151002135307.8DA54819D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea3485d085200b82da6e6cc79ea75c01128a1df9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add -std=gnu89 to CFLAGS to keep pre gcc5 inline function symbols visibility
rules.

Fixes:
http://autobuild.buildroot.net/results/a7e/a7e684174b90a852318a7a8bf41c4f477d159d56/
http://autobuild.buildroot.net/results/ab0/ab01f8e0467e85322c63b81bb7e84fd251e5d556/
http://autobuild.buildroot.net/results/117/117a68bf648b050dabed8088d1165c1d7d9301f0/

and more.

[Peter: add a comment explaining why]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vtun/vtun.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 2b64ab9..2a3f548 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -14,4 +14,7 @@ VTUN_CONF_OPTS = \
 	--with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
 	--with-lzo-lib=$(STAGING_DIR)/usr/lib
 
+# Assumes old-style gcc inline symbol visibility rules
+VTUN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
+
 $(eval $(autotools-package))
