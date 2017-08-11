From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 11 Aug 2017 19:17:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/git: security bump to version 2.13.5
Message-ID: <20170811171728.30489-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-1000117:
http://www.mail-archive.com/linux-kernel at vger.kernel.org/msg1466490.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Since bumping to 2.14.1 would be a feature patch we stick to 2.13.x in
the master branch and bump to 2.14.1 on the next branch.

 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 66bb1367d..8aa0503db 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,4 +1,4 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 91aa23be428f67eb19616f43fa0229d567e9acf4f08fba33eb0b627e4d323e62  git-2.13.3.tar.xz
+sha256 21c9e29caac86d244ac7af78bc3422746dabb903cb3952a1ceefd801020ad1a1  git-2.13.5.tar.xz
 sha256 5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256 1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index d95c2fec3..fe4d55376 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.13.3
+GIT_VERSION = 2.13.5
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.11.0
