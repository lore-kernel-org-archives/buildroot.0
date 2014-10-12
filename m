From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 15:21:25 +0200
Subject: [Buildroot] [PATCH] docs/manual: remove example comment causing
	issues
Message-ID: <1413120085-21063-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The manual gives this example for using the github macro:

  FOO_VERSION = v1.0 # tag or full commit ID

Unfortunately, people copy/pasting this example will face weird make
errors, because it leads the FOO_VERSION variable to end with a
space. Since the manual is anyway explaining just below the example
that FOO_VERSION can be used either with a tag or a full commit ID,
the simplest solution is to simply remove this comment.

Reported-by: Edd Robbins <edd.robbins@gmail.com>
Cc: Edd Robbins <edd.robbins@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-tips.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 0d4fcb0..fde0a44 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -42,7 +42,7 @@ on GitHub. As GitHub is known to have changed download mechanisms in the
 past, the 'github' helper function should be used as shown below.
 
 ------------------------
-FOO_VERSION = v1.0 # tag or full commit ID
+FOO_VERSION = v1.0
 FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
 ------------------------
 
-- 
2.0.0
