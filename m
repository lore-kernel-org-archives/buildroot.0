From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 18 Mar 2015 16:50:35 +0100
Subject: [Buildroot] [PATCH v2 02/10] autobuild-run,
	python3: dict.iteritems()->items()
In-Reply-To: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
Message-ID: <1426693843-28792-3-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some dict methods, like iteritems(), have been dropped in Python 3,
while the semantics of others, e.g. items(), has changed.

The Py3k variant of items() returns a "view" object, whereas the Py2k variant
returns a list, but both methods essentially do the same thing here.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 01f0957..1edffc1 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -105,7 +105,7 @@ Default values for the arguments are:
 
   %s
 """ % '\n  '.join(
-    ['%s = %s' % (key, val) for (key, val) in defaults.iteritems()])
+    ['%s = %s' % (key, val) for (key, val) in defaults.items()])
 
 __doc__ = doc
 
-- 
2.3.2
