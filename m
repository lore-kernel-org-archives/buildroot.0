From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2014 12:10:44 +0100
Subject: [Buildroot] [git commit] infra: remove unused helper function
	pkgparentdir
Message-ID: <20140205123039.B23BF9C7D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=582af5884ff98f292b4f15f8379e6bb9004f5c51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to the previous patches, no-one is using pkgparentdir anymore, so
remove it.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 51dd738..91a1981 100644
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
