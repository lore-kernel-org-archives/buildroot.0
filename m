From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Nov 2017 21:16:51 +0100
Subject: [Buildroot] [git commit] suport/download: force svn to be
 non-interactive
Message-ID: <20171105200936.AE96780F9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4013f11a5b71f238b36f45dcdeb46b7f7a01e600
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/2af/2af7412846c576089f8596857ab8c81ac31c1bed/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Andr?? Hentschel <nerv@dawncrow.de>
Reviewed-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/svn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/svn b/support/download/svn
index 77abf3d..9f27d71 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -33,6 +33,6 @@ _svn() {
     eval ${SVN} "${@}"
 }
 
-_svn export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
+_svn --non-interactive export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
 
 tar czf "${output}" "${basename}"
