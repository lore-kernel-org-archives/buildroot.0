From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Dec 2013 12:07:21 +0100
Subject: [Buildroot] [git commit] git: bump to version 1.8.5.2
Message-ID: <20131219153646.1F6639C0F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69d33ae53346108a514edbf4411890d4713e3505
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes since v1.8.5.1:
 * "git diff -- ':(icase)makefile'" was unnecessarily rejected at the
   command line parser.

 * "git cat-file --batch-check=ok" did not check the existence of
   the named object.

 * "git am --abort" sometimes complained about not being able to write
   a tree with an 0{40} object in it.

 * Two processes creating loose objects at the same time could have
   failed unnecessarily when the name of their new objects started
   with the same byte value, due to a race condition.

Also contains typofixes, documentation updates and trivial code clean-ups.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index cf16250..3e198a6 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION         = 1.8.5.1
+GIT_VERSION         = 1.8.5.2
 GIT_SITE            = http://git-core.googlecode.com/files/
 GIT_LICENSE         = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES   = COPYING LGPL-2.1
