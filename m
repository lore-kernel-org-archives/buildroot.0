From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 04 Oct 2013 15:12:30 +0200
Subject: [Buildroot] [PATCH 1 of 5] legal info: fix saving of host package
	licenses
In-Reply-To: <patchbomb.1380892349@argentina>
References: <patchbomb.1380892349@argentina>
Message-ID: <d7c22445ecf6c2362d5b.1380892350@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to a missing dollar sign, the licenses for host packages were not saved.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: Aaargh this dollar sign madness!

 package/pkg-generic.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -511,7 +511,7 @@ ifeq ($(call qstrip,$$($(2)_LICENSE_FILE
 	@$(call legal-license-nofiles,$$($(2)_RAWNAME))
 	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	@$(foreach F,$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F))$$(sep))
+	@$(foreach F,$$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F),$(call UPPERCASE,$(5)))$$(sep))
 endif
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 # Copy the source tarball (just hardlink if possible)
