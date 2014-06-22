From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 14:41:14 +0200
Subject: [Buildroot] [PATCH 3/4] legal-info: add a comment about what
	packages we save the tarballs of
In-Reply-To: <cover.1403439879.git.yann.morin.1998@free.fr>
References: <cover.1403439879.git.yann.morin.1998@free.fr>
Message-ID: <d7b60854f85ee35d8bf21c60987fc0e34d4a059e.1403439879.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

As the legal-info infra only (rightfully) saves the tarballs of packages
that:
  - we want to redistribute,
  - and are not local,
  - and are not overriden,

add a comment stating so.

This should clarify the code-block, which although trivial to read,
was not easy to interpret without thinking thouroughly about it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e8f2f9e..55936d2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -627,6 +627,9 @@ ifneq ($$($(2)_LICENSE_FILES),)
 $(1)-legal-info: $(1)-extract
 endif
 
+# We only save the sources of packages we want to redistribute, that are
+# non-local, and non-overriden. So only store, in the manifest, the tarball
+# name of those packages.
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_SITE_METHOD),local)
 ifneq ($$($(2)_SITE_METHOD),override)
-- 
1.8.3.2
