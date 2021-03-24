From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 23:47:00 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/git: security
 bump to version 2.26.3
Message-ID: <20210324222552.F00E886125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3b2491cc8157137153142641869bad73d35f08f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

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
index d043590222..dc091efcd8 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  6d65132471df9e531807cb2746f8be317e22a343b9385bbe11c9ce7f0d2fc848  git-2.26.2.tar.xz
+sha256  ae8592b0878334aceb3d018dec7525562a19adee3a6fb5dcae11aab80cb06367  git-2.26.3.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 0a67a7e1e2..62838e3307 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.26.2
+GIT_VERSION = 2.26.3
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
