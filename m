From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 22:48:50 +0100
Subject: [Buildroot] [git commit] legal-info: remove FOO_MANIFEST_TARBALL
	and FOO_MANIFEST_SITE defaults
Message-ID: <20150202214925.AE40C80817@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5027ca582fe41d0c780e86218c8c0aedad6fb4db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When FOO_SOURCE is non-empty, FOO_MANIFEST_TARBALL is always set.
When FOO_SOURCE is empty, FOO_MANIFEST_TARBALL is not set, but also
never used, due to the if below which defuses the whole legal-info
processing for packages that have FOO_SOURCE explicitly set to an
empty string.

So get rid of the default assignment to "not saved".

Do it for FOO_MANIFEST_SITE as well: it is pointless to have
FOO_MANIFEST_SITE with an empty FOO_SOURCE in a package. A quick
grep session in the sources confirmed this assumption is indeed
true for the current code.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9643a30..38ef581 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -653,8 +653,6 @@ $(2)_MANIFEST_SITE = $$(call qstrip,$$($(2)_SITE))
 endif
 endif
 endif
-$(2)_MANIFEST_TARBALL ?= not saved
-$(2)_MANIFEST_SITE ?= not saved
 
 # legal-info: produce legally relevant info.
 $(1)-legal-info:
