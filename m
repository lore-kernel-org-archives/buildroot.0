From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Mar 2021 22:18:44 +0200
Subject: [Buildroot] [git commit] support/scripts: fix pycompile for short
 filenames
Message-ID: <20210330195356.C29798A673@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fdc878d73938e70335a667a831ded67a15df53c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bert Outtier <outtierbert@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pycompile.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index 2b636e03cb..b8cd3cee6c 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -30,7 +30,7 @@ def compile_one(host_path, strip_root=None, verbose=False):
     if os.path.islink(host_path) or not os.path.isfile(host_path):
         return  # only compile real files
 
-    if not re.match(r"^[_A-Za-z][_A-Za-z0-9]+\.py$",
+    if not re.match(r"^[_A-Za-z][_A-Za-z0-9]*\.py$",
                     os.path.basename(host_path)):
         return  # only compile "importable" python modules
 
