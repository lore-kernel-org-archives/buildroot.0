From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 21:24:02 +0200
Subject: [Buildroot] [git commit] gcc: drop unused legacy arc-2016.09 patch
Message-ID: <20170516192539.CDE4082915@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e00f9daa04e9a84f5191f479d7236dea72fbf35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was forgotten when the arc toolchain version was bumped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-define-_REENTRANT-when-pthread-is-passed.patch | 34 ----------------------
 1 file changed, 34 deletions(-)

diff --git a/package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch b/package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch
deleted file mode 100644
index ee9add5..0000000
--- a/package/gcc/arc-2016.09-release/895-arc-define-_REENTRANT-when-pthread-is-passed.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4c6367c99461fdd7bd5613483f2582d7f08fba87 Mon Sep 17 00:00:00 2001
-From: Vlad Zakharov <vzakhar@synopsys.com>
-Date: Tue, 28 Feb 2017 17:41:11 +0300
-Subject: [PATCH] arc: define _REENTRANT when -pthread is passed
-
-The compiler is supposed to have the builtin defined _REENTRANT defined
-when -pthread is passed, which wasn't done on the ARC architecture.
-
-When _REENTRANT is not passed, the C library will not use reentrant
-functions, and the latest version of ax_pthread.m4 from the
-autoconf-archive will no longer detect that thread support is
-available (see https://savannah.gnu.org/patch/?8186).
-
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- gcc/config/arc/arc.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gcc/config/arc/arc.h b/gcc/config/arc/arc.h
-index 611ef54..fdd4b5d 100644
---- a/gcc/config/arc/arc.h
-+++ b/gcc/config/arc/arc.h
-@@ -93,6 +93,7 @@ along with GCC; see the file COPYING3.  If not see
- %{mdsp-packa:-D__Xdsp_packa} %{mcrc:-D__Xcrc} %{mdvbf:-D__Xdvbf} \
- %{mtelephony:-D__Xtelephony} %{mxy:-D__Xxy} %{mmul64: -D__Xmult32} \
- %{mlock:-D__Xlock} %{mswape:-D__Xswape} %{mrtsc:-D__Xrtsc} \
-+%{pthread:-D_REENTRANT} \
- %{mcpu=nps400:-D__NPS400__}"
-
- #define CC1_SPEC "\
---
-2.7.4
-
