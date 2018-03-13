From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:37:54 +0100
Subject: [Buildroot] [git commit] .flake8: ignore utils/diffconfig
Message-ID: <20180313213834.BCA0B82566@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9324167b8090fa4703703c28e8cefff7fa001d21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This script comes from the kernel source, so ignore any code style
warnings for it in order to keep it as close as possible to the original
one, making synchronization between repos easier.

The option --exclude for flake8/pycodestyle is an absolute list and has
a default, so ideally the default values should be added too.
But the use cases for flake8 in the tree are:
 - when developing a new script or changing an existing one, the
   developer calls flake8 only on that script;
 - in the GitLab job, a list of all Python files to be tested is created
   and then passed to flake8.
None of these involve calling 'flake8' without parameters, so don't care
about adding the default value.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .flake8 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.flake8 b/.flake8
index afdb967930..7dd7b541cc 100644
--- a/.flake8
+++ b/.flake8
@@ -1,2 +1,5 @@
 [flake8]
+exclude=
+    # copied from the kernel sources
+    utils/diffconfig
 max-line-length=132
