From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 09:16:27 +0200
Subject: [Buildroot] [git commit] Revert "czmq: unbreak static linking"
Message-ID: <20150513071940.6886C7FD09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=878b9aaba9c0bd77c0964cdc78c63cc07aaf96cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit aa5254f1a2bc0ea3181d51990c18681b3071b9db.

Now that zeromq's pkg-config file is fixed, we no longer need this
workaround for static linking.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/czmq/czmq.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 789e700..d25bf01 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -18,12 +18,6 @@ CZMQ_LICENSE_FILES = LICENSE
 # host-python, so disable asciidoc entirely.
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
 
-# zeromq uses C++, but czmq forgets to explicitly link with libstdc++
-# (or use g++ to link), breaking static linking.
-ifeq ($(BR2_STATIC_LIBS),y)
-CZMQ_CONF_ENV += LIBS='-lstdc++'
-endif
-
 define CZMQ_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
 endef
