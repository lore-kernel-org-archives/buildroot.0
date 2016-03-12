From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Mar 2016 23:55:06 +0100
Subject: [Buildroot] [git commit] bash re-enable parallel builds
Message-ID: <20160312225511.CD4B9817CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9d61200f60d00c21c8190f4c1fe3ccabd7a70ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They don't seem to be causing any issues after bumping to the 4.3.x
series and several tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
