From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2019 21:46:36 +0100
Subject: [Buildroot] [git commit branch/next] package/python-huepy: fix
 build with python3.8
Message-ID: <20191114204747.097698EF48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2be8b37a1e3448f27ace763c25bdf69641ce27f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
  - http://autobuild.buildroot.net/results/240c397a6479b98f30b63b5135bfb2e45281de7d

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-huepy/0001-fix-import-with-python3.patch | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/python-huepy/0001-fix-import-with-python3.patch b/package/python-huepy/0001-fix-import-with-python3.patch
new file mode 100644
index 0000000000..e04eacb228
--- /dev/null
+++ b/package/python-huepy/0001-fix-import-with-python3.patch
@@ -0,0 +1,8 @@
+--- a/huepy/__init__.py
++++ b/huepy/__init__.py
+@@ -1,4 +1,4 @@
+-from hue import COMMANDS
++from .hue import COMMANDS
+ 
+ __all__ = list(COMMANDS.keys())
+ __version__ = '1.0.1'
