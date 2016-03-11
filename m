From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 15:27:51 -0300
Subject: [Buildroot] [PATCH] bash re-enable parallel builds
Message-ID: <1457720871-10472-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They don't seem to be causing any issues after bumping to the 4.3.x
series and several tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bash/bash.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 97d7182..3cd8d82 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -22,10 +22,6 @@ BASH_CONF_ENV += \
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_printf_a_format=yes
 
-# Parallel build sometimes fails because some of the generator tools
-# are built twice (i.e. while executing).
-BASH_MAKE = $(MAKE1)
-
 # The static build needs some trickery
 ifeq ($(BR2_STATIC_LIBS),y)
 BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
-- 
2.4.10
