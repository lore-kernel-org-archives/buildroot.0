From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Nov 2017 22:22:16 +0100
Subject: [Buildroot] [PATCH] suport/download: force svn to be non-interactive
Message-ID: <20171103212216.11772-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/2af/2af7412846c576089f8596857ab8c81ac31c1bed/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Andr? Hentschel <nerv@dawncrow.de>
---
 support/download/svn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/svn b/support/download/svn
index 77abf3d02d..9f27d71f86 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -33,6 +33,6 @@ _svn() {
     eval ${SVN} "${@}"
 }
 
-_svn export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
+_svn --non-interactive export ${verbose} "${@}" "'${repo}@${rev}'" "'${basename}'"
 
 tar czf "${output}" "${basename}"
-- 
2.11.0
