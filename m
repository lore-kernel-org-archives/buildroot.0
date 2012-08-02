From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:45 -0000
Subject: [Buildroot] [git commit branch/next] module-init-tools: don't build
	static tools for host
Message-ID: <20120802195244.D95EF8E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c460cc8161a0738873351d990a522cee90173231
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As pointed out on IRC, the static tools causes problems on distributions
without glibc-static, and we don't need them - So just disable them like
we do for the target build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/module-init-tools/module-init-tools.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index ad92a1a..96c8378 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -18,6 +18,7 @@ MODULE_INIT_TOOLS_CONF_OPT = \
 MODULE_INIT_TOOLS_AUTORECONF = YES
 HOST_MODULE_INIT_TOOLS_AUTORECONF = YES
 HOST_MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
+HOST_MODULE_INIT_TOOLS_CONF_OPT = --disable-static-utils
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
