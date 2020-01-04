From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jan 2020 09:29:36 +0100
Subject: [Buildroot] [git commit] support/testing: really fix python-gitdb2
 test
Message-ID: <20200104082258.370E08EA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed56b7b5479176307a8f30cd3927d066b4e340d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test-case for python-gitdb2 consists solely in verifying that the
module can indeed be imported.

However, flake8 errors out on unused imports. Furthermore, it also
errors about wildcard imports, as it can detect unused symbols.

Commit d8c86be9cd7 (support/testing: fix python-gitdb2 test) tried to
address this issue, by explicitly squelching the two errors, F401 and
F403.

While that works on recent distros, the image used by our docker
pipeline is laggign behind and the flake8 there only handles at most a
single error in the noqa list.

Do as is done with the other python samples, and just blindly ignore
all errors.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/sample_python_gitdb2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_gitdb2.py b/support/testing/tests/package/sample_python_gitdb2.py
index 493dcaaee2..4a82fdf587 100644
--- a/support/testing/tests/package/sample_python_gitdb2.py
+++ b/support/testing/tests/package/sample_python_gitdb2.py
@@ -1 +1 @@
-from gitdb import *  # NOQA: F401 F403
+from gitdb import *  # noqa
