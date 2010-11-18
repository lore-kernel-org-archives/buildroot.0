From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 18 Nov 2010 05:37:47 -0500
Subject: [Buildroot] [PATCH] ignore more patch related files
Message-ID: <1290076667-32488-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches shouldn't be committed to the top level, and that is where
`git format-patch` typically operates, so ignore that stuff.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 .gitignore |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 18588e8..685a9c2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -7,5 +7,8 @@
 /.config
 *.depend
 *.o
+/*.patch
+/*.diff
 *.orig
+*.rej
 *~
-- 
1.7.3.2
