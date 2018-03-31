From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 20:56:55 +0200
Subject: [Buildroot] [git commit] ktap: bump version for linux-4.8 support
Message-ID: <20180331185756.B34F07FCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a612c9ed9d7fde40a4e5bfe851e9a8ee7228bf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #10776

The upstream git repo contains a number of fixes for building against newer
kernel versions, so bump the version.

git shortlog eb66d40310c93dc82bc8eac889744c1ed1f01f7b..
Alain Kalker (2):
      uprobe: Print the symbol, not the matching pattern
      uprobe: Blacklist uretprobes on _start

Aleksa Sarai (2):
      runtime: update GFP_WAIT to GFP_RECLAIM
      userspace: fix up argument parsing NULL dereference

Alexey Makhalov (1):
      Fix building for v4.8 kernel

Azat Khuzhin (12):
      Use get_unused_fd_flags(0) instead of get_unused_fd()
      Support trace_seq::seq
      Ignore separate debug files (*.dwo)
      Use trace_seq_has_overflowed()
      makefile: split vim plugins installing into separate target
      makefile: use DESTDIR for install (allow to change install dir)
      makefile: install: create dirs
      makefile: use ldflags for linking ktap
      makefile: add CPPFLAGS to KTAPC_CFLAGS, to allow change default flags
      ignore: exclude /debian
      Support compilation for 4.2 (ftrace_events cleanup)
      runtime: fix building on 4.3

Jovi Zhangwei (11):
      Merge pull request #84 from azat/linux-3.19-fixes-v3
      Merge pull request #85 from azat/debian-preparations-v2
      Merge pull request #88 from NanXiao/master
      Merge pull request #89 from NanXiao/patch-1
      Merge pull request #91 from NanXiao/patch-1
      Merge pull request #90 from azat/linux-4.2-compilation-fixes
      Merge pull request #99 from cyphar/fix-null-deref
      Merge pull request #98 from cyphar/fix-gfp-reclaim
      Merge pull request #97 from azat/fix-building-4.3-__GFP_RECLAIM
      Merge pull request #103 from ackalker/blacklist
      Merge pull request #104 from YustasSwamp/master

Nan Xiao (3):
      Update tutorial.md
      Update Makefile
      Fix memory leak issue in main function.

WEI ZHANG (1):
      ktap: Change the copyright to Huawei Technologies

While we are at it, also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ktap/ktap.hash | 3 ++-
 package/ktap/ktap.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ktap/ktap.hash b/package/ktap/ktap.hash
index d58bd85b43..1eff712501 100644
--- a/package/ktap/ktap.hash
+++ b/package/ktap/ktap.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 bc8b03a53c430ae4fcf594ffdf31e2b2ed47a8fee25dd8fea60aa34f75441707  ktap-eb66d40310c93dc82bc8eac889744c1ed1f01f7b.tar.gz
+sha256 44a0808d57175cf9d15466f720e1e10d5ed1abc3497aedf9ddd6469545552345  ktap-23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f.tar.gz
+sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE-GPL
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index b9b3dbcc53..3b9134da65 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KTAP_VERSION = eb66d40310c93dc82bc8eac889744c1ed1f01f7b
+KTAP_VERSION = 23bc7a4a94bd9e4e1b8b7c06632e61c041d57b5f
 KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
 KTAP_LICENSE = GPL-2.0
 KTAP_LICENSE_FILES = LICENSE-GPL
