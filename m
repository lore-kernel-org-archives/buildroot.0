From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Jun 2010 09:33:32 +0200
Subject: [Buildroot] [git commit master 1/1] file: don't force _GNU_SOURCE
	in CFLAGS
Message-ID: <20100610073512.C072A8164F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7c709f4affc44f3bbc9a09fec8d84ae3807e31e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Breaks the build with BR2_CONFIG_CACHE, and isn't needed anyway, as
the configure script figures out to add _GNU_SOURCE to config.h
anyway.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/file/file.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index c4f9709..b8281d0 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -6,7 +6,6 @@
 
 FILE_VERSION = 5.04
 FILE_SITE = ftp://ftp.astron.com/pub/file/
-FILE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
 
-- 
1.7.1
