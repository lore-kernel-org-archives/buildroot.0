From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 May 2011 23:27:22 +0200
Subject: [Buildroot] [git commit] setlocalversion: fix svn revision l10n-ism
Message-ID: <20110525212842.22D3983610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cff599de0816704be966c5f9da36bfab14d9dcaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed an l10n-ism in retrieval of the svn revision.

Signed-off-by: Stephane Fillod <fillods@users.sf.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 scripts/setlocalversion |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index cc2c128..8d6fe90 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -56,9 +56,9 @@ if hgid=`hg id 2>/dev/null`; then
 fi
 
 # Check for svn and a svn repo.
-if rev=`svn info 2>/dev/null | grep '^Last Changed Rev'`; then
+if rev=`LANG=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
 	rev=`echo $rev | awk '{print $NF}'`
-	changes=`svn status 2>/dev/null | grep '^[AMD]' | wc -l`
+	changes=`LANG=C svn status 2>/dev/null | grep '^[AMD]' | wc -l`
 
 	# Are there uncommitted changes?
 	if [ $changes != 0 ]; then
-- 
1.7.3.4
