From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 10:44:04 +0100
Subject: [Buildroot] [PATCH 5 of 5 v3] infra: remove unused helper function
	pkgparentdir
In-Reply-To: <patchbomb.1391593439@argentina>
References: <patchbomb.1391593439@argentina>
Message-ID: <980a8e31ce0f4027a589.1391593444@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to the previous patches, no-one is using pkgparentdir anymore, so
remove it.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: rebase, update comment (Arnout)

 package/pkg-utils.mk |  5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -55,12 +55,9 @@ endef
 # Helper functions to determine the name of a package and its
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
 # variable provided by make. This is used by the *TARGETS macros to
-# automagically find where the package is located. Note that the
-# pkgdir macro is carefully written to handle the case of the Linux
-# package, for which the package directory is an empty string.
+# automagically find where the package is located.
 pkgdir       = $(dir $(lastword $(MAKEFILE_LIST)))
 pkgname      = $(lastword $(subst /, ,$(pkgdir)))
-pkgparentdir = $(patsubst %$(pkgname)/,%,$(pkgdir))
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
