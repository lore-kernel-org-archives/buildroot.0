From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 21:12:22 +0100
Subject: [Buildroot] [git commit] support/testing: fix python-gitdb2 test
Message-ID: <20191218200902.C865B8C53D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8c86be9cd70d7e821b9571a237a1a20243f5d58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cthe test-case for python-gitdb2 consists solely in verifying that the
module can indeed be imported.

However, flake8 errors out on unused imports. Furthermore, it also
errors about wildcard imports, as it can detect unused symbols.

Squelch those errors.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/sample_python_gitdb2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_gitdb2.py b/support/testing/tests/package/sample_python_gitdb2.py
index 3742eed2d8..493dcaaee2 100644
--- a/support/testing/tests/package/sample_python_gitdb2.py
+++ b/support/testing/tests/package/sample_python_gitdb2.py
@@ -1 +1 @@
-from gitdb import *
+from gitdb import *  # NOQA: F401 F403
