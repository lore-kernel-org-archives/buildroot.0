From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 23:43:59 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/git: security
 bump to version 2.24.4
Message-ID: <20210324222558.2092B860B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=618185998fe67f58f5a867233f5f3ae6d584c0f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes CVE-2021-21300:

On case-insensitive file systems with support for symbolic links, if Git is
configured globally to apply delay-capable clean/smudge filters (such as Git
LFS), Git could be fooled into running remote code during a clone.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 5734fea175..090a40b014 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 da8c594c21ef965cdff427f27a7a384833d96d4d67f3a13915b498009646ef29  git-2.24.3.tar.xz
+sha256 9b80e7707db22c932b7a3d56ef8a7cde7db04a2f329830b2c06a9a248f9e6b83  git-2.24.4.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index d5e81b529c..bc8e917eeb 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.24.3
+GIT_VERSION = 2.24.4
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
