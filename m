From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  6 Aug 2014 18:47:52 +0200
Subject: [Buildroot] [PATCH 1/2 v3] support/download: fix the git helper
In-Reply-To: <cover.1407343550.git.yann.morin.1998@free.fr>
References: <cover.1407343550.git.yann.morin.1998@free.fr>
Message-ID: <3fd879ddde189866b89708d5f0c67d52e74cd120.1407343550.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Seiderer <ps.report@gmx.net>

Re-add the git_done variable (lost in commit [1]).

Fixes download problem reported by Rohit Kumar [2].

[1] http://git.buildroot.net/buildroot/commit/?id=7e40a1103a919a8177f00ddca2b46b4439953511
[2] http://lists.busybox.net/pipermail/buildroot/2014-August/103733.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/download/git | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/download/git b/support/download/git
index 6edaa90..d451530 100755
--- a/support/download/git
+++ b/support/download/git
@@ -19,6 +19,7 @@ basename="${4}"
 
 # Try to see if we can do a shallow clone, since it is faster
 # than a full clone.
+git_done=0
 if [ -n "$(${GIT} ls-remote "${repo}" "${cset}" 2>&1)" ]; then
     printf "Doing shallow clone\n"
     if ${GIT} clone --depth 1 -b "${cset}" --bare "${repo}" "${basename}"; then
-- 
1.9.1
