From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Sep 2018 07:06:24 +0200
Subject: [Buildroot] [git commit] e2fsprogs: drop unicode space in comment
Message-ID: <20180919050629.1FD49885D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adc98bfa260569c844843934768b0ae77cf64a86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c1cf9ba80 (e2fsprogs: disable parallel build for host installation)
added a unicode (non-breaking) space in a comment.  Replace it with a normal
ASCII space for consistency with elsewhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index d9ae0b29b6..a483261caa 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -79,7 +79,7 @@ E2FSPROGS_INSTALL_STAGING_OPTS = \
 	DESTDIR=$(STAGING_DIR) \
 	install-libs
 
-#??Package does not build in parallel due to improper make rules
+# Package does not build in parallel due to improper make rules
 define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install install-libs
 endef
