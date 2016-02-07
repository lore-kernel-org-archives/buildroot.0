From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:01:10 +0100
Subject: [Buildroot] [git commit] package/psmisc: fix musl build
Message-ID: <20160207140133.3F87C817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b53ff0d2926044ad4cb2f5de8a522e09af1edbed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream commit fixing a build error not yet been found by the
autobuilders:

pstree.c: In function ???get_threadname???:
pstree.c:798:15: error: ???PATH_MAX??? undeclared (first use in this function)
     char path[PATH_MAX + 1];
               ^
pstree.c:798:15: note: each undeclared identifier is reported only once for each function it appears in
pstree.c:798:10: warning: unused variable ???path??? [-Wunused-variable]
     char path[PATH_MAX + 1];
          ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/psmisc/psmisc.hash | 1 +
 package/psmisc/psmisc.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
index fd99edf..5e489ed 100644
--- a/package/psmisc/psmisc.hash
+++ b/package/psmisc/psmisc.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a  psmisc-22.21.tar.gz
+sha256  4f1cb11c7182ad96e682ec50a2d9a6a22079a2b11dffde3bb3cb67823b679422  e7203c36a2a4dc10cd8268a5dc036fc9c2a73b6c.diff
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index cbdf4c6..2f83b7d 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -6,6 +6,8 @@
 
 PSMISC_VERSION = 22.21
 PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
+PSMISC_PATCH = \
+	https://gitlab.com/psmisc/psmisc/commit/e7203c36a2a4dc10cd8268a5dc036fc9c2a73b6c.diff
 PSMISC_LICENSE = GPLv2
 PSMISC_LICENSE_FILES = COPYING
 PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
