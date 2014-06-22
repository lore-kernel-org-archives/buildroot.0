From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:04:13 +0200
Subject: [Buildroot] [git commit] legal-info: add a comment about what
	packages we save the tarballs of
Message-ID: <20140622200420.C56C69D06D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1da3f17477329cb46846d6392abcc6b4a6c1e084
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b113684..851ae0f 100644
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
