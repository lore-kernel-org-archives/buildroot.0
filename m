From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 13:48:04 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] support/scripts: fix
 pycompile for short filenames
Message-ID: <20210403112714.E39187FB72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea9fdc21ef92aa409afbe5d20af11c1710c5701c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Bert Outtier <outtierbert@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6fdc878d73938e70335a667a831ded67a15df53c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pycompile.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index 8399d57936..6b50713bcc 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -28,7 +28,7 @@ def compile_one(host_path, strip_root=None):
     if os.path.islink(host_path) or not os.path.isfile(host_path):
         return  # only compile real files
 
-    if not re.match(r"^[_A-Za-z][_A-Za-z0-9]+\.py$",
+    if not re.match(r"^[_A-Za-z][_A-Za-z0-9]*\.py$",
                     os.path.basename(host_path)):
         return  # only compile "importable" python modules
 
