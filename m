From: Charles Eidsness <charles@ccxtechnologies.com>
Date: Thu, 17 Dec 2020 06:56:16 -0500
Subject: [Buildroot] [PATCH] fix the single character python file bug
Message-ID: <CAAV4SYY66WVh1=-h3v7doZcYiFnCMCZ9ath0MaZiEdbp2LBeXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 support/scripts/pycompile.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index 7041a0506b..e2cfc2683c 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -30,7 +30,7 @@ def compile_one(host_path, strip_root=None, verbose=False):
         return  # only compile real files

     if not re.match(
-            r"^[_A-Za-z][_A-Za-z0-9]+\.py$", os.path.basename(host_path)
+            r"^[_A-Za-z][_A-Za-z0-9]*\.py$", os.path.basename(host_path)
     ):
         return  # only compile "importable" python modules

-- 
2.29.2
