From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2019 08:21:34 +0100
Subject: [Buildroot] [git commit] package/git: security bump to version
 2.24.1
Message-ID: <20191212072102.6AC278912D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=108b76dbd4eb2507c76f81420dd5fded374b2ce8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerabilities:

* CVE-2019-1348:
   The --export-marks option of git fast-import is exposed also via
   the in-stream command feature export-marks=... and it allows
   overwriting arbitrary paths.

 * CVE-2019-1349:
   When submodules are cloned recursively, under certain circumstances
   Git could be fooled into using the same Git directory twice. We now
   require the directory to be empty.

 * CVE-2019-1350:
   Incorrect quoting of command-line arguments allowed remote code
   execution during a recursive clone in conjunction with SSH URLs.

 * CVE-2019-1351:
   While the only permitted drive letters for physical drives on
   Windows are letters of the US-English alphabet, this restriction
   does not apply to virtual drives assigned via subst <letter>:
   <path>. Git mistook such paths for relative paths, allowing writing
   outside of the worktree while cloning.

 * CVE-2019-1352:
   Git was unaware of NTFS Alternate Data Streams, allowing files
   inside the .git/ directory to be overwritten during a clone.

 * CVE-2019-1353:
   When running Git in the Windows Subsystem for Linux (also known as
   "WSL") while accessing a working directory on a regular Windows
   drive, none of the NTFS protections were active.

 * CVE-2019-1354:
   Filenames on Linux/Unix can contain backslashes. On Windows,
   backslashes are directory separators. Git did not use to refuse to
   write out tracked files with such filenames.

 * CVE-2019-1387:
   Recursive clones are currently affected by a vulnerability that is
   caused by too-lax validation of submodule names, allowing very
   targeted attacks via remote code execution in recursive clones.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 40cd8a169f..74bf334b78 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 9f71d61973626d8b28c4cdf8e2484b4bf13870ed643fed982d68b2cfd754371b  git-2.24.0.tar.xz
+sha256 723f24dce8fdd621a308b6187553fce7d5244205c065fe0a3aebd0b7c3f88562  git-2.24.1.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 4fec24bf27..a5c8669fc9 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.24.0
+GIT_VERSION = 2.24.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
