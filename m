From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 28 Oct 2016 12:14:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/gpm: indentation cleanup
In-Reply-To: <1477649644-5187-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1477649644-5187-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1477649644-5187-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/gpm/gpm.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 6d3b5d2..ed4c1fd 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -15,8 +15,9 @@ GPM_DEPENDENCIES = host-bison
 # if not already installed in staging dir, gpm Makefile may fail to find some
 # of the headers needed to generate build dependencies, the first time it is
 # built. CPPFLAGS is used to pass the right include path to dependency rules.
-GPM_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -I$(@D)/src/headers/" \
-			   ac_cv_path_emacs=no
+GPM_CONF_ENV = \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -I$(@D)/src/headers/" \
+	ac_cv_path_emacs=no
 
 # For some reason, Microblaze gcc does not define __ELF__, which gpm
 # configure script uses to determine whether the architecture uses ELF
-- 
1.9.1
