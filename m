From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:46:11 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] git: security bump to
 version 2.16.4
Message-ID: <20180617150241.0909E81213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0732985141943136ae2f38ee8b0412cbf5f3571c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Forward port of security fixes from the 2.13.7 release. The 2.13.7
release notes say this:

 * Submodule "names" come from the untrusted .gitmodules file, but we
   blindly append them to $GIT_DIR/modules to create our on-disk repo
   paths. This means you can do bad things by putting "../" into the
   name. We now enforce some rules for submodule names which will cause
   Git to ignore these malicious names (CVE-2018-11235).

   Credit for finding this vulnerability and the proof of concept from
   which the test script was adapted goes to Etienne Stalmans.

 * It was possible to trick the code that sanity-checks paths on NTFS
   into reading random piece of memory (CVE-2018-11233).

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ae1f0472957c40d67d316cd741467ed5d85fcf40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index fea1a1e904..4bcc5ee5d3 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 d65d99e9e5b081c1f14ea018973806e942a2eb7d0da2ebc01bd2525adee62d48  git-2.16.3.tar.xz
+sha256 6e69b0e9c487e5da52a14d4829f0b6a28b2c18a0bb6fb67c0dc8b5b5658bd532  git-2.16.4.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 2115e04e31..ac7b8f2e8c 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.16.3
+GIT_VERSION = 2.16.4
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
