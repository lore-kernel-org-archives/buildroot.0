From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 28 Aug 2013 23:29:35 +0200
Subject: [Buildroot] [PATCH] bash: fails in parallel build
Message-ID: <1377725375-17016-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bash/bash.mk | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
1.8.4.rc3
