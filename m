From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 04 Feb 2014 17:21:56 +0100
Subject: [Buildroot] [PATCH 4 of 4 v2] infra: remove unused helper function
	pkgparentdir
In-Reply-To: <patchbomb.1391530912@argentina>
References: <patchbomb.1391530912@argentina>
Message-ID: <1ed04f399fb1b71847c1.1391530916@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to the previous patches, no-one is using pkgparentdir anymore, so
remove it.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-utils.mk |  1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -60,7 +60,6 @@ endef
 # package, for which the package directory is an empty string.
 pkgdir       = $(dir $(lastword $(MAKEFILE_LIST)))
 pkgname      = $(lastword $(subst /, ,$(call pkgdir)))
-pkgparentdir = $(patsubst %$(call pkgname)/,%,$(call pkgdir))
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
