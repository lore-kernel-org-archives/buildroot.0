From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Aug 2013 23:58:27 +0200
Subject: [Buildroot] [git commit] bash: fails in parallel build
Message-ID: <20130828215846.D6DAE9B5D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=339868d244dba9befe71b7bca2d70ce723b230b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bash/bash.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index efd2334..0c8a954 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -16,6 +16,10 @@ BASH_CONF_ENV +=                       \
    bash_cv_func_sigsetjmp=present      \
    bash_cv_printf_a_format=yes
 
+# Parallel build sometimes fails because some of the generator tools
+# are built twice (i.e. while executing).
+BASH_MAKE = $(MAKE1)
+
 # The static build needs some trickery
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 BASH_CONF_OPT += --enable-static-link --without-bash-malloc
