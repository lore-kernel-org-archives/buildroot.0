From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 13 Mar 2018 00:09:45 -0300
Subject: [Buildroot] [PATCH v3 7/7] .flake8: ignore utils/diffconfig
In-Reply-To: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1520910585-19097-8-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v2 -> v3:
  - no changes

Changes v1 -> v2:
  - instead of tweaking even more the script from the kernel source,
    ignore any warnings for it;  (suggested by Thomas Petazzoni)
  - move the patch after the one adding the GitLab job so I can
    reference it in the commit message.
---
 .flake8 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.flake8 b/.flake8
index afdb967..7dd7b54 100644
--- a/.flake8
+++ b/.flake8
@@ -1,2 +1,5 @@
 [flake8]
+exclude=
+    # copied from the kernel sources
+    utils/diffconfig
 max-line-length=132
-- 
2.7.4
