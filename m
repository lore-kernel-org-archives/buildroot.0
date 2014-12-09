From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 Dec 2014 11:51:21 +0000
Subject: [Buildroot] [PATCH 3/3] slang: use specific build and install
	commands for static builds
In-Reply-To: <1418125881-7915-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418125881-7915-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1418125881-7915-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doing this we ensure that only the static library and a static version
of slsh are built.

Fixes:
  http://autobuild.buildroot.net/results/f12/f124ca3737baf5aca32029226805133d3544715c/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
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
-- 
1.7.1
