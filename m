From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:32 +0100
Subject: [Buildroot] [PATCH 20/28] atk: remove unused host variant
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fef01e5a74239111bcc590fa096f376fe51cc2ae.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The atk package is used as a dependency in the libglade and libgtk2
packages.

The libglade package has no host variant, and does not depend on
host-atk.

The libgtk2 package depends on atk, and has a host variant, but the
host variant of libgtk2 overrides HOST_LIBGTK2_DEPENDENCIES to limit
the number of dependencies, and host-atk is not amongst those
dependencies.

Therefore, host-atk is useless and can be removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atk/atk.mk |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 0453acb..2a85edd 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -43,8 +43,4 @@ ATK_CONF_OPT =  --disable-glibtest --enable-explicit-deps=no \
 
 ATK_DEPENDENCIES = libglib2 host-pkgconf
 
-HOST_ATK_CONF_OPT = \
-		--disable-glibtest
-
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
1.7.9.5
