From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:40:34 +0200
Subject: [Buildroot] [git commit] support/download: fix the git helper
Message-ID: <20140806174117.622C59D3C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d1ab4321168fdda714be30c6b53e2ce0027509d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Re-add the git_done variable (lost in commit [1]).

Fixes download problem reported by Rohit Kumar [2].

[1] http://git.buildroot.net/buildroot/commit/?id=7e40a1103a919a8177f00ddca2b46b4439953511
[2] http://lists.busybox.net/pipermail/buildroot/2014-August/103733.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/git |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
