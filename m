From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2020 22:05:22 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/audit: fix
 -fno-common build failure
Message-ID: <20200601201603.259E285F5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beeb15f4e6996e17544e2f76267c13a5bd8bb00c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Added upstream patch for fixing build failure when using GCC10 as a host
compiler (-fno-common is now default).

Fixes:
http://autobuild.buildroot.net/results/c4b/c4bba80e9fc476247c7ba28850831c6a8edd559f/build-end.log

Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e7323e9d54ee9fc8a0c4af5f4198ac6024cc6b53)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nitions-need-to-be-external-when-building.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/audit/0003-Header-definitions-need-to-be-external-when-building.patch b/package/audit/0003-Header-definitions-need-to-be-external-when-building.patch
new file mode 100644
index 0000000000..9a546261df
--- /dev/null
+++ b/package/audit/0003-Header-definitions-need-to-be-external-when-building.patch
@@ -0,0 +1,28 @@
+From 017e6c6ab95df55f34e339d2139def83e5dada1f Mon Sep 17 00:00:00 2001
+From: Steve Grubb <sgrubb@redhat.com>
+Date: Fri, 10 Jan 2020 21:13:50 -0500
+Subject: [PATCH] Header definitions need to be external when building with
+ -fno-common (which is default in GCC 10) - Tony Jones
+
+Patch taken from upstream: https://github.com/linux-audit/audit-userspace/commit/017e6c6ab95df55f34e339d2139def83e5dada1f
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ src/ausearch-common.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ausearch-common.h b/src/ausearch-common.h
+index 6669203..3040547 100644
+--- a/src/ausearch-common.h
++++ b/src/ausearch-common.h
+@@ -50,7 +50,7 @@ extern pid_t event_pid;
+ extern int event_exact_match;
+ extern uid_t event_uid, event_euid, event_loginuid;
+ extern const char *event_tuid, *event_teuid, *event_tauid;
+-slist *event_node_list;
++extern slist *event_node_list;
+ extern const char *event_comm;
+ extern const char *event_filename;
+ extern const char *event_hostname;
+-- 
+2.20.1
+
