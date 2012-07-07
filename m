From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Jul 2012 17:51:17 +0200
Subject: [Buildroot] [PATCH] graph-depends: ignore a few more uninteresting
	targets
Message-ID: <1341676277-5506-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 4d82282..da050da 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -128,6 +128,8 @@ if mode == FULL_MODE:
     for tg in targets:
         # Skip uninteresting targets
         if tg == 'target-generic-issue' or \
+                tg == 'target-generic-getty-busybox' or \
+                tg == 'target-generic-do-remount-rw' or \
                 tg == 'target-finalize' or \
                 tg == 'erase-fakeroots' or \
                 tg == 'target-generic-hostname':
-- 
1.7.9.5
