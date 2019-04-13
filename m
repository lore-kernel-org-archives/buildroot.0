From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 15:59:47 +0200
Subject: [Buildroot] [git commit] support/scripts/brpkutil.py: wrap at 80
 columns
Message-ID: <20190413135734.33F838E1C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63cb953d145dfbcdcdeb551236525502a083d89d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, the flake8 script didn't help us to detect when Python
scripts were incorrectly wrapped. Now, however, it does report such
errors.

Fix one such an error now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Arnout: give commit message a more positive tone]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/brpkgutil.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
index 9ceda71b7f..f65068d348 100644
--- a/support/scripts/brpkgutil.py
+++ b/support/scripts/brpkgutil.py
@@ -31,7 +31,8 @@ def get_dependency_tree():
 
     cmd = ["make", "-s", "--no-print-directory", "show-dependency-tree"]
     with open(os.devnull, 'wb') as devnull:
-        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull, universal_newlines=True)
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull,
+                             universal_newlines=True)
         output = p.communicate()[0]
 
     for l in output.splitlines():
