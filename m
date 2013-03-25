From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Mar 2013 00:28:07 +0100
Subject: [Buildroot] [PATCH 12/15] manual: cleanup appendix.txt
In-Reply-To: <cover.1364253936.git.yann.morin.1998@free.fr>
References: <cover.1364253936.git.yann.morin.1998@free.fr>
Message-ID: <368b4a518e2bc606b6936cc3ff05002f4eadd9e2.1364253936.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: one more stuff->feature fixup]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes since v5:
* s/stuff/features/ (Thomas P.)

Changes since v1:
* move the surrounding text of the list back in appendix.txt (Arnout)
---
 docs/manual/appendix.txt        |   29 ++++++++++++++++++++---------
 docs/manual/deprecated-list.txt |    2 +-
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index ef34169..ffde7e4 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -6,15 +6,26 @@ Appendix
 
 include::makedev-syntax.txt[]
 
+
+// Automatically generated lists:
+
 [[package-list]]
-Available packages
-------------------
-// docs/manaual/pkg-list.txt is generated using the following command:
-// $ git grep -E '\((autotools|cmake|generic)-package\)' package/ |  \
-//     cut -d':' -f1 | grep '\.mk$' | \
-//     sed -e 's;.*\?/\(.*\?\).mk;* \1;' | \
-//     sort > docs/manual/pkg-list.txt
-
-include::pkg-list.txt[]
+Package Selection for the target
+--------------------------------
+
+include::package-list.txt[]
+
+[[host-package-list]]
+Host utilities
+--------------
+
+include::host-package-list.txt[]
+
+[[deprecated-list]]
+Deprecated features
+-------------------
+
+The following features are marked as _deprecated_ in Buildroot due to
+their status either too old or unmaintained.
 
 include::deprecated-list.txt[]
diff --git a/docs/manual/deprecated-list.txt b/docs/manual/deprecated-list.txt
index 6dc87a4..9c8f105 100644
--- a/docs/manual/deprecated-list.txt
+++ b/docs/manual/deprecated-list.txt
@@ -4,7 +4,7 @@
 Deprecated list
 ---------------
 
-The following stuff are marked as _deprecated_ in Buildroot due to
+The following features are marked as _deprecated_ in Buildroot due to
 their status either too old or unmaintained.
 
 // list generated using the followings command:
-- 
1.7.2.5
