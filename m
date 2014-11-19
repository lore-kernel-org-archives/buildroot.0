From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 19 Nov 2014 17:45:46 +0000
Subject: [Buildroot] [PATCH] git: bump version to 2.1.3
Message-ID: <1416419146-1571-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 2.1.3
- Add a hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/git/git.hash |    2 ++
 package/git/git.mk   |    5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 package/git/git.hash

diff --git a/package/git/git.hash b/package/git/git.hash
new file mode 100644
index 0000000..3f8db5f
--- /dev/null
+++ b/package/git/git.hash
@@ -0,0 +1,2 @@
+# From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
+sha256  fe1b06aefa73e8d86cbd352523fc0950b8904ae2ec47085b22b7880f45de6f57  git-2.1.3.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index 8a69ee5..f338438 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-GIT_VERSION = 1.8.5.4
-GIT_SITE = http://git-core.googlecode.com/files
+GIT_VERSION = 2.1.3
+GIT_SOURCE = git-$(GIT_VERSION).tar.xz
+GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib host-gettext
-- 
1.7.1
