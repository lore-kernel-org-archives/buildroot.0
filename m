From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:26:19 +0100
Subject: [Buildroot] [git commit] pkg-waf: add additional variables for
	build step
Message-ID: <20161211142730.1C5357FD79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=611d6e1a882f478b84a53b4dcb10a3a2c6741517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some waf packages may want to pass additional variables to waf script in
build step. Add the possibility to do so by defining <pkg>_BUILD_OPTS.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-waf.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index a82f45c..f9d435e 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -49,6 +49,7 @@ else
 $(2)_WAF = ./waf
 endif
 
+$(2)_BUILD_OPTS 			?=
 $(2)_INSTALL_STAGING_OPTS 		?=
 $(2)_INSTALL_TARGET_OPTS 		?=
 
@@ -75,7 +76,8 @@ endif
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$(@D) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) build -j $$(PARALLEL_JOBS)
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
+		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS)
 endef
 endif
 
