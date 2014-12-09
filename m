From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 20:19:58 +0100
Subject: [Buildroot] [git commit] slang: use specific build and install
	commands for static builds
Message-ID: <20141209193410.1F2747FD31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=301102e136c43545b5fff09a1f2fe8debf970064
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Doing this we ensure that only the static library and a static version
of slsh are built.

Fixes:
  http://autobuild.buildroot.net/results/f12/f124ca3737baf5aca32029226805133d3544715c/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/slang/slang.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 15b65b3..4dc9ad7 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -48,4 +48,10 @@ ifeq ($(BR2_PACKAGE_READLINE),y)
 	SLANG_DEPENDENCIES += readline
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	SLANG_MAKE_OPTS = static
+	SLANG_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
+	SLANG_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
+endif
+
 $(eval $(autotools-package))
