From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 21:59:40 +0200
Subject: [Buildroot] [git commit] package/ofono: remove autoreconf
Message-ID: <20191022195504.A1FDF822B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cd6c1658797fe17d4f90af9e30e5f2325bd2dea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch that required an autoreconf is no longer there since commit
a465dd54fc22423b4140441d8f29d55e249d5848 ("package/ofono: bump to
version 1.30")

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ofono/ofono.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index ce05dfcadf..756998687b 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -49,7 +49,5 @@ else
 OFONO_CONF_OPTS += --disable-bluetooth
 endif
 
-# required by 0003-build-Add-check-for-explicit_bzero-support.patch
-OFONO_AUTORECONF = YES
 
 $(eval $(autotools-package))
