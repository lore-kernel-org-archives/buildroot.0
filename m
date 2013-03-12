From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 12 Mar 2013 11:37:19 +0100
Subject: [Buildroot] [PATCH] qt5jsbackend: Remove dependency on bz2 module
In-Reply-To: <1362687540-19440-27-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-27-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1363084639-9610-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The Python bz2 module is only needed in certain cases, so only import
it when needed. In the normal qt5jsbackend build, this allows to remove
the dependency on this module.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Thomas, feel free to squash this with the qt5jsbackend patch.
---
 ...8-js2c.py-Remove-dependency-on-bz2-module.patch |   38 ++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/qt5/qt5jsbackend/qt5jsbackend-0001-v8-js2c.py-Remove-dependency-on-bz2-module.patch

diff --git a/package/qt5/qt5jsbackend/qt5jsbackend-0001-v8-js2c.py-Remove-dependency-on-bz2-module.patch b/package/qt5/qt5jsbackend/qt5jsbackend-0001-v8-js2c.py-Remove-dependency-on-bz2-module.patch
new file mode 100644
index 0000000..17ceda1
--- /dev/null
+++ b/package/qt5/qt5jsbackend/qt5jsbackend-0001-v8-js2c.py-Remove-dependency-on-bz2-module.patch
@@ -0,0 +1,38 @@
+From 51d6d005eb383908a4d7031c61cef14cc4cbdc38 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 12 Mar 2013 08:07:09 +0100
+Subject: [PATCH] v8: js2c.py: Remove dependency on bz2 module
+
+The Python bz2 module is only needed in certain cases, so only import
+it when needed. In the normal qtjsbackend build, this allows to remove the
+dependency on this module.
+
+[arnout at mind.be: ported patch from nodejs]
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/3rdparty/v8/tools/js2c.py |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/v8/tools/js2c.py b/src/3rdparty/v8/tools/js2c.py
+index d06cbe4..c63a640 100644
+--- a/src/3rdparty/v8/tools/js2c.py
++++ b/src/3rdparty/v8/tools/js2c.py
+@@ -33,7 +33,6 @@
+ 
+ import os, re, sys, string
+ import jsmin
+-import bz2
+ 
+ 
+ def ToCAsciiArray(lines):
+@@ -344,6 +343,7 @@ def JS2C(source, target, env):
+   else:
+     raw_sources_declaration = RAW_SOURCES_COMPRESSION_DECLARATION
+     if env['COMPRESSION'] == 'bz2':
++      import bz2
+       all_sources = bz2.compress("".join(all_sources))
+     total_length = len(all_sources)
+     sources_data = ToCArray(all_sources)
+-- 
-- 
1.7.10.4
