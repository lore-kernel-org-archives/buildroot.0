From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:02:52 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/chrony: security
 bump to version 3.5.1
Message-ID: <20200828170226.5B41A8377C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bb171edb2960077f5f9eb480ee5d39edef43dcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes the following security issues:

CVE-2020-14367: Insecure writing of pidfile
-------------------------------------------

When chronyd is configured to save the pidfile in a directory where the
chrony user has write permissions (e.g. /var/run/chrony - the default
since chrony-3.4), an attacker that compromised the chrony user account
could create a symbolic link at the location of the pidfile to make
chronyd starting with root privileges follow the symlink and write its
process ID to a file for which the chrony user doesn't have write
permissions, causing a denial of service, or data loss.

This issue was reported by Matthias Gerstner of SUSE.

For further details, see the oss-security posting:
https://www.openwall.com/lists/oss-security/2020/08/21/1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 15484553f3d7e5d1a2a7dfb017ba40ad42b975e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.hash | 7 +++----
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index c31c6893aa..57ce91ac80 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,4 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2019/05/msg00001.html
-md5 5f66338bc940a9b51eede8f391e7bed3  chrony-3.5.tar.gz
-sha1 79e9aeace143550300387a99f17bff04b45673f7  chrony-3.5.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2020/08/msg00000.html
+sha256  1ba82f70db85d414cd7420c39858e3ceca4b9eb8b028cbe869512c3a14a2dca7  chrony-3.5.1.tar.gz
 # Locally calculated
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index d7f5c05183..f8938a80f5 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 3.5
+CHRONY_VERSION = 3.5.1
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
