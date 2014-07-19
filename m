From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:09 +0200
Subject: [Buildroot] [PATCH 02/20 v3] support/gen-manual-lists.py: remove
	unneeded arg in private function
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <cdac12bc4b9c07f2d0d910d5c17f225438dd1bae.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No need to pass as argument to a function, members of the class it's in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/gen-manual-lists.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
1.9.1
