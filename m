From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:10:08 +0200
Subject: [Buildroot] [git commit] pkg-virtual: simplify definition of
	FOO_VERSION to 'virtual'
Message-ID: <20140614171145.A54C39CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6fc9abd10ea00df53dcaea0083063a1e3433150
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As mentioned in the e-mail accompanying the introduction of the pkg-virtual
infrastructure [1], the definition of FOO_VERSION is 'strange'.

After the cleanup of single/double dollar signs in inner-generic-package,
the special construction in pkg-virtual is no longer needed and can be
simplified.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[1] http://lists.busybox.net/pipermail/buildroot/2014-April/093670.html
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-virtual.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 56e2d04..f5d7567 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -45,8 +45,7 @@ endif
 $(2)_SOURCE =
 
 # Fake a version string, so it looks nicer in the build log
-$(3)_VERSION = virtual
-HOST_$(3)_VERSION = virtual
+$(2)_VERSION = virtual
 
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES
