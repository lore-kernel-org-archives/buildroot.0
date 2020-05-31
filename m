From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:15:27 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/ltrace: directly
 use s.b.o to fetch the archive
Message-ID: <20200531211722.0255185F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a8c2571110a17b62bccdaa5648ef2f427803818
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

During the migration from alioth to gitlab, the git repository for ltrace
was not migrated. There is a repository on gitlab.com, owned by the debian
maintainer, but that repository does not contain the sha1 we know of:
    https://gitlab.com/cespedes/ltrace

s.b.o. is the only known location so far to host the archive, so switch
to it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 982728364141c4369003b1dbdc24e51428be6b39)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltrace/ltrace.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index b71215e43b..2eb60fe450 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -5,7 +5,14 @@
 ################################################################################
 
 LTRACE_VERSION = c22d359433b333937ee3d803450dc41998115685
-LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
+#LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
+
+# Upstream is dead: the git reporistory for ltrace did not follow during the
+# migration from alioth to gitlab, and there is no longer any official
+# upstream repository with the expected sha1, except for the tarball cached on
+# s.b.o., so we go fetch it there.
+LTRACE_SITE = http://sources.buildroot.org/ltrace
+
 LTRACE_DEPENDENCIES = elfutils
 LTRACE_CONF_OPTS = --disable-werror
 LTRACE_LICENSE = GPL-2.0
