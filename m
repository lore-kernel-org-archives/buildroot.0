From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 18:02:07 +0200
Subject: [Buildroot] [git commit] support/gen-manual-lists.py: remove
	unneeded arg in private function
Message-ID: <20140719160431.926AC9CFD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34363f0df1da4e69ae663fc43d7c8a1a980c0bb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No need to pass as argument to a function, members of the class it's in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/gen-manual-lists.py |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/gen-manual-lists.py b/support/scripts/gen-manual-lists.py
index 69f4c7e..483b384 100644
--- a/support/scripts/gen-manual-lists.py
+++ b/support/scripts/gen-manual-lists.py
@@ -384,7 +384,7 @@ class Buildroot:
                     return s
             return None
 
-        def _get_providers(config, symbol):
+        def _get_providers(symbol):
             providers = list()
             for sym in self.config:
                 if not sym.is_symbol():
@@ -404,7 +404,7 @@ class Buildroot:
                                   + " (w/ " + l + ")"
                             providers.append(l)
                         else:
-                            providers.extend(_get_providers(config,sym))
+                            providers.extend(_get_providers(sym))
             return providers
 
         if what == "layout":
@@ -415,7 +415,7 @@ class Buildroot:
 
         if what == "symbol":
             pkg = re.sub(r"^BR2_PACKAGE_HAS_(.+)$", r"\1", symbol.get_name())
-            providers = _get_providers(self.config, symbol)
+            providers = _get_providers(symbol)
 
             return "| {0:<20} <| {1:<32} <| {2}\n".format(pkg.lower(),
                                                           '+' + symbol.get_name() + '+',
