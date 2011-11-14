From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 16:16:17 +0100
Subject: [Buildroot] [git commit] file: install to staging as well
Message-ID: <20111114153837.581A88F3AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a276ff90301ee82a4955fa15c8410fb2e3cf7ddd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

file provides libmagic, which other packages might use - So install it
into staging.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/file/file.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index d9a533f..7536056 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -8,6 +8,7 @@ FILE_VERSION = 5.09
 FILE_SITE = ftp://ftp.astron.com/pub/file/
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
+FILE_INSTALL_STAGING = YES
 
 define FILE_UNINSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(FILE_DIR)
