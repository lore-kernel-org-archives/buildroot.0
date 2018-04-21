From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Apr 2018 11:10:52 +0200
Subject: [Buildroot] [PATCH 3/7] support/graph-depends: also cut on host-tar
In-Reply-To: <cover.1524301847.git.yann.morin.1998@free.fr>
References: <cover.1524301847.git.yann.morin.1998@free.fr>
Message-ID: <da435d55ac5f2aed6af2be3f1aab994f05662a09.1524301847.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When host-tar is needed, it is a mandatory dependency of all packages.
As such, drawing the dependency lines toward host-tar would uselessly
clutter the graph.

So, like for the skeleton and host-skeleton, we cut the dependency chains
toward host-tar.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 40a8eee5e9..46ff164262 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -179,6 +179,7 @@ CUT_ON_PACKAGES = [
     'toolchain',
     'skeleton',
     'host-skeleton',
+    'host-tar',
 ]
 
 
-- 
2.14.1
