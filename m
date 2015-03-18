From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 18 Mar 2015 16:50:38 +0100
Subject: [Buildroot] [PATCH v2 05/10] autobuild-run: avoid use of builtin as
	varname
In-Reply-To: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
Message-ID: <1426693843-28792-6-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"file" is a type name in Python 2.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 40bd657..38e5bae 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -637,10 +637,10 @@ def send_results(result, **kwargs):
         for root, dirs, files in os.walk(srcroot):
             dest = os.path.join(destroot, os.path.relpath(root, srcroot))
 
-            for file in files:
-                if file == 'config.log':
+            for fname in files:
+                if fname == 'config.log':
                     os.makedirs(dest)
-                    shutil.copy(os.path.join(root, file), os.path.join(dest, file))
+                    shutil.copy(os.path.join(root, fname), os.path.join(dest, fname))
 
     copy_config_log_files()
 
-- 
2.3.2
