From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 14 Dec 2015 12:57:05 +0100
Subject: [Buildroot] [PATCH] python-pyxml: add a patch to fix syntax errors
Message-ID: <1450094225-4625-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Patch renames variable 'as' to 'pas' to avoid reserved keyword usage.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../python-pyxml-fix-syntax-errors.patch           | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/python-pyxml/python-pyxml-fix-syntax-errors.patch

diff --git a/package/python-pyxml/python-pyxml-fix-syntax-errors.patch b/package/python-pyxml/python-pyxml-fix-syntax-errors.patch
new file mode 100644
index 0000000..1628d5f
--- /dev/null
+++ b/package/python-pyxml/python-pyxml-fix-syntax-errors.patch
@@ -0,0 +1,60 @@
+python-pyxml: fix syntax errors
+
+Rename 'as' variable to 'pas' to avoid reserved keyword usage.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ xml/xpath/ParsedAbbreviatedAbsoluteLocationPath.py |   10 +++++-----
+ xml/xpath/ParsedAbbreviatedRelativeLocationPath.py |    4 ++--
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+--- a/xml/xpath/ParsedAbbreviatedAbsoluteLocationPath.py
++++ b/xml/xpath/ParsedAbbreviatedAbsoluteLocationPath.py
+@@ -24,8 +24,8 @@
+         self._rel = rel
+         nt = ParsedNodeTest.ParsedNodeTest('node', '')
+         ppl = ParsedPredicateList.ParsedPredicateList([])
+-        as = ParsedAxisSpecifier.ParsedAxisSpecifier('descendant-or-self')
+-        self._step = ParsedStep.ParsedStep(as, nt, ppl)
++        pas = ParsedAxisSpecifier.ParsedAxisSpecifier('descendant-or-self')
++        self._step = ParsedStep.ParsedStep(pas, nt, ppl)
+         return
+ 
+     def evaluate(self, context):
+@@ -36,7 +36,7 @@
+         rt = self._step.select(context)
+         res = []
+         l = len(rt)
+-        
++
+         sub_rt = []
+         for ctr in range(l):
+             n = rt[ctr]
+@@ -51,7 +51,7 @@
+         context.setNodePosSize(origState)
+         return result
+     select = evaluate
+-    
++
+     def pprint(self, indent=''):
+         print indent + str(self)
+         self._step.pprint(indent + '  ')
+@@ -65,4 +65,4 @@
+ 
+     def __repr__(self):
+         return '/%s/%s' % (repr(self._step), repr(self._rel))
+-        
++
+--- a/xml/xpath/ParsedAbbreviatedRelativeLocationPath.py
++++ b/xml/xpath/ParsedAbbreviatedRelativeLocationPath.py
+@@ -28,8 +28,8 @@
+         self._right = right
+         nt = ParsedNodeTest.ParsedNodeTest('node','')
+         ppl = ParsedPredicateList.ParsedPredicateList([])
+-        as = ParsedAxisSpecifier.ParsedAxisSpecifier('descendant-or-self')
+-        self._middle = ParsedStep.ParsedStep(as, nt, ppl)
++        pas = ParsedAxisSpecifier.ParsedAxisSpecifier('descendant-or-self')
++        self._middle = ParsedStep.ParsedStep(pas, nt, ppl)
+ 
+     def evaluate(self, context):
+         res = []
-- 
2.1.4
