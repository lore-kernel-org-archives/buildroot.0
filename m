From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 14:35:22 +0100
Subject: [Buildroot] [git commit] legal-info: remove outdated comment
Message-ID: <20160306133543.405F27FB47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=777c36ea0f63e3070877125bfaf958152828c28a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This comment is outdated since the assignment of $(2)_MANIFEST_TARBALL
and $(2)_MANIFEST_SITE have been removed, which happened in
b9f4727ff4d512868352494f5209fff4da147473.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: adjust comment as suggested by Yann E. MORIN.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9ea2a70..3904c09 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -754,8 +754,7 @@ $(1)-legal-info: $(1)-patch
 endif
 
 # We only save the sources of packages we want to redistribute, that are
-# non-local, and non-overriden. So only store, in the manifest, the tarball
-# name of those packages.
+# non-overriden (local or true override).
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 # Packages that have a tarball need it downloaded beforehand
