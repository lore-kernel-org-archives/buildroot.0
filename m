From: John Keeping <john@metanate.com>
Date: Wed, 19 Jun 2019 16:05:26 +0100
Subject: [Buildroot] [PATCH] download/git: fix formatting of error message
Message-ID: <20190619150526.31746-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'.' should be at the end of the sentence, not the beginning of a new
line.

Signed-off-by: John Keeping <john@metanate.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 17ca04eb98..075f665bbf 100755
--- a/support/download/git
+++ b/support/download/git
@@ -130,7 +130,7 @@ fi
 # scratch won't help, so we don't want to trash the repository for a
 # missing commit. We just exit without going through the ERR trap.
 if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
-    printf "Commit '%s' does not exist in this repository\n." "${cset}"
+    printf "Commit '%s' does not exist in this repository.\n" "${cset}"
     exit 1
 fi
 
-- 
2.22.0
