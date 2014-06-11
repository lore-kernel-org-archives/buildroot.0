From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Jun 2014 21:12:26 +0200
Subject: [Buildroot] [PATCH 3 of 6 v4] pkg-virtual: simplify definition of
 FOO_VERSION to 'virtual'
In-Reply-To: <patchbomb.1402513943@localhost>
References: <patchbomb.1402513943@localhost>
Message-ID: <39d24c5ad999ce15ca58.1402513946@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As mentioned in the e-mail accompanying the introduction of the pkg-virtual
infrastructure [1], the definition of FOO_VERSION is 'strange'.

After the cleanup of single/double dollar signs in inner-generic-package,
the special construction in pkg-virtual is no longer needed and can be
simplified.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[1] http://lists.busybox.net/pipermail/buildroot/2014-April/093670.html

---
v4: no changes
v3: no changes
v2: no changes

Note: this patch should only be applied when the first patch in this series
is.

 package/pkg-virtual.mk |  3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff -r 686857abb0b9 -r 39d24c5ad999 package/pkg-virtual.mk
--- a/package/pkg-virtual.mk	Sat May 10 10:04:45 2014 +0200
+++ b/package/pkg-virtual.mk	Sun May 11 10:32:44 2014 +0200
@@ -45,8 +45,7 @@
 $(2)_SOURCE =
 
 # Fake a version string, so it looks nicer in the build log
-$(3)_VERSION = virtual
-HOST_$(3)_VERSION = virtual
+$(2)_VERSION = virtual
 
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES
