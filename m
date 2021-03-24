From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 23:33:50 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/git: bump version
 to 2.30.2
Message-ID: <20210324222608.1EA75860B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=101f3d8ea17da6f90518fbd7fa8d89a3bfef4e0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix CVE-2021-21300:

  On case-insensitive file systems with support for symbolic links,
  if Git is configured globally to apply delay-capable clean/smudge
  filters (such as Git LFS), Git could be fooled into running
  remote code during a clone.

For details see [1] and [2].

[1] http://lkml.iu.edu/hypermail/linux/kernel/2102.1/01858.html
[2] http://lkml.iu.edu/hypermail/linux/kernel/2103.1/02533.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6e0771062c5262da1810f87b3150588b9efdbedb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 375ce787e9..c1960b9728 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  55735021109565721af805af382c45cce73c3cfaa59daad22443d1477d334d19  git-2.30.0.tar.xz
+sha256  41f7d90c71f9476cd387673fcb10ce09ccbed67332436a4cc58d7af32c355faa  git-2.30.2.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 55178de138..910dcf5fa1 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.30.0
+GIT_VERSION = 2.30.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
