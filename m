From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 May 2018 22:40:16 +0200
Subject: [Buildroot] [PATCH 3/7 v2] support/graph-depends: also cut on
 host-tar
In-Reply-To: <cover.1525812011.git.yann.morin.1998@free.fr>
References: <cover.1525812011.git.yann.morin.1998@free.fr>
Message-ID: <1720de1106c56f93ceb24c31cdf9b2039080d26c.1525812011.git.yann.morin.1998@free.fr>
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
