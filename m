From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jul 2011 23:26:29 +0200
Subject: [Buildroot] [git commit] e2fsprogs: ensure util-linux is built
	before e2fsprogs
Message-ID: <20110728215655.DDE4D8B553@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1af183e95b0b61cb122ea8417aa2254930b73ecb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For libblkid.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 42bdd2c..21e65d1 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -20,7 +20,7 @@ E2FSPROGS_CONF_OPT = \
 	--disable-e2initrd-helper \
 	--disable-testio-debug
 
-E2FSPROGS_DEPENDENCIES = host-pkg-config
+E2FSPROGS_DEPENDENCIES = host-pkg-config util-linux
 
 E2FSPROGS_MAKE_OPT = \
 	LDCONFIG=true
-- 
1.7.3.4
