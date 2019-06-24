From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Jun 2019 21:11:39 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] support/download/git: fix
 formatting of error message
Message-ID: <20190624191036.05CAC82611@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=307e74985829e4dc4c0bc3abc13d24236d09d703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

'.' should be at the end of the sentence, not the beginning of a new
line.

Signed-off-by: John Keeping <john@metanate.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8dd1a41630fff72638b7942c926c2f50095ab0d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
