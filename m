From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 21:56:57 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/git: security
 bump to version 2.24.3
Message-ID: <20200525194015.3C7F891AA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c226c4a11b0122e699957fcff769091e3098e49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

 * (2.24.2) With a crafted URL that contains a newline in it, the credential
   helper machinery can be fooled to give credential information for a wrong
   host.  The attack has been made impossible by forbidding a newline
   character in any value passed via the credential protocol.

 * (2.24.3) With a crafted URL that contains a newline or empty host, or
   lacks a scheme, the credential helper machinery can be fooled into
   providing credential information that is not appropriate for the protocol
   in use and host being contacted.

   Unlike the vulnerability CVE-2020-5260 fixed in v2.17.4, the
   credentials are not for a host of the attacker's choosing; instead,
   they are for some unspecified host (based on how the configured
   credential helper handles an absent "host" parameter).

   The attack has been made impossible by refusing to work with
   under-specified credential patterns.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 74bf334b78..5734fea175 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 723f24dce8fdd621a308b6187553fce7d5244205c065fe0a3aebd0b7c3f88562  git-2.24.1.tar.xz
+sha256 da8c594c21ef965cdff427f27a7a384833d96d4d67f3a13915b498009646ef29  git-2.24.3.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index dd79c41e4a..d5e81b529c 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.24.1
+GIT_VERSION = 2.24.3
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
