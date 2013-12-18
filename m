From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 18 Dec 2013 14:14:40 +0800
Subject: [Buildroot] [PATCH] git: bump to version 1.8.5.2
Message-ID: <1387347280.25722.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/git/git.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.1.2
