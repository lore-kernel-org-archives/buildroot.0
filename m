From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Apr 2021 21:53:24 +0200
Subject: [Buildroot] [PATCH] package/opentyrian: switch ot using github
Message-ID: <20210429195324.2463255-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenTyrian was previously managed in a Mercurial repository hosted on
Bitbucket. Mid-2020, Bitbucket shut off all its Mercurial repositories:
    https://bitbucket.org/blog/sunsetting-mercurial-support-in-bitbucket

Since then, OpenTyrian's source code is inacessible, but we have had no
build failure associated as there is an old archive hosted on s.b.o, so
that all builds fallback to downloading that:
    http://sources.buildroot.net/opentyrian/opentyrian-9c9f0ec3532b.tar.gz

However, the project has been revived (kinda) on github:
    https://github.com/opentyrian/opentyrian

Git commit cf5dbeb69eebd9ef9afc4473088d9469b79589eb has been found to
be the closest, both in content and date, to the Mercuail reference
9c9f0ec3532b we were using. The only deltas are in Mercurial-specific
files:

 b/.hg_archival.txt |    5     0     5     0 -----
 b/.hgtags          |    2     1     1     0 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

While at it, add a hash file.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/opentyrian/opentyrian.hash | 3 +++
 package/opentyrian/opentyrian.mk   | 5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 package/opentyrian/opentyrian.hash

diff --git a/package/opentyrian/opentyrian.hash b/package/opentyrian/opentyrian.hash
new file mode 100644
index 0000000000..0d1f4927ee
--- /dev/null
+++ b/package/opentyrian/opentyrian.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2b0db65c735cc099279ea3da6d9b76f791633897cd0f5b67528f70de0758a944  opentyrian-cf5dbeb69eebd9ef9afc4473088d9469b79589eb.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
index 12e41ad998..690323334e 100644
--- a/package/opentyrian/opentyrian.mk
+++ b/package/opentyrian/opentyrian.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-OPENTYRIAN_VERSION = 9c9f0ec3532b
-OPENTYRIAN_SITE = https://bitbucket.org/opentyrian/opentyrian
-OPENTYRIAN_SITE_METHOD = hg
+OPENTYRIAN_VERSION = cf5dbeb69eebd9ef9afc4473088d9469b79589eb
+OPENTYRIAN_SITE = $(call github,opentyrian,opentyrian,$(OPENTYRIAN_VERSION))
 OPENTYRIAN_LICENSE = GPL-2.0+
 OPENTYRIAN_LICENSE_FILES = COPYING
 
-- 
2.25.1
