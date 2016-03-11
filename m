From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:49:21 +0100
Subject: [Buildroot] [PATCH 08/16 v5] core/legal-info: add package version
	to license directory
In-Reply-To: <cover.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <9257e1d446b142b073f315243e0e95c632a171d1.1457718289.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we save the source archives in a directory named after the
package and its version, do the same for the license files, for
consistency.

It has a not-so-bad side-effect of also saving the version string in
the all-licenses list.

The only (small) side-effect, is that the warnings about undefined
_LICENSE_FILES now contains the version string, too. That's unavoidable,
since that's what is stored in the legal report.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

---
Changes v1 -> v2:
  - s/drawback/side-effect/  (Luca)
---
 package/pkg-generic.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 31f3e17..4515b40 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -807,10 +807,10 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 # is that the license still applies to the files distributed as part
 # of the rootfs, even if the sources are not themselves redistributed.
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
-	@$$(call legal-license-nofiles,$$($(2)_RAWNAME),$$(call UPPERCASE,$(4)))
-	@$$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
+	@$$(call legal-license-nofiles,$$($(2)_RAWNAME_VERSION),$$(call UPPERCASE,$(4)))
+	@$$(call legal-warning-pkg,$$($(2)_RAWNAME_VERSION),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
+	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME_VERSION),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_SITE_METHOD),local)
-- 
1.9.1
