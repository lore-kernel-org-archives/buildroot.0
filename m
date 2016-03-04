From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  5 Mar 2016 00:39:13 +0100
Subject: [Buildroot] [PATCH 2/2] legal-info: remove outdated comment
In-Reply-To: <1457134753-28197-1-git-send-email-luca@lucaceresoli.net>
References: <1457134753-28197-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1457134753-28197-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This comment is outdated since the assignment of $(2)_MANIFEST_TARBALL
and $(2)_MANIFEST_SITE have been removed, which happened in
b9f4727ff4d512868352494f5209fff4da147473.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9ea2a707baa4..189ccf8c8415 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -754,8 +754,7 @@ $(1)-legal-info: $(1)-patch
 endif
 
 # We only save the sources of packages we want to redistribute, that are
-# non-local, and non-overriden. So only store, in the manifest, the tarball
-# name of those packages.
+# non-local, and non-overriden.
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 # Packages that have a tarball need it downloaded beforehand
-- 
1.9.1
