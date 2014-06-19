From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Thu, 19 Jun 2014 15:30:15 -0400
Subject: [Buildroot] [PATCH] support: graph-depends requires Python 2
Message-ID: <1403206215-5562-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python 3 becomes the default version on some distributions (such as
Archlinux), while they all (Debian, Ubuntu, Arch, Fedora, etc.) define a
python2 symlink for consistency.

Let's specify it in the graph-depends script to make it clear that it
requires the version 2 of Python to work.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 support/scripts/graph-depends | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index e2a5e1e..e323e3f 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/python2
 
 # Usage (the graphviz package must be installed in your distribution)
 #  ./support/scripts/graph-depends [-p package-name] > test.dot
-- 
2.0.0
