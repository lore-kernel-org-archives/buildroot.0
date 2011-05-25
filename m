From: f8cfe at free.fr <f8cfe@free.fr>
Date: Wed, 25 May 2011 21:10:55 +0200 (CEST)
Subject: [Buildroot] [PATCH] scripts: fixed svn revision l10n-ism
In-Reply-To: <99986051.7954541306350551899.JavaMail.root@zimbra4-e1.priv.proxad.net>
Message-ID: <874525559.7955141306350655467.JavaMail.root@zimbra4-e1.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed an l10n-ism in retrieval of the svn revision.

Signed-off-by: Stephane Fillod <fillods@users.sf.net>
---
 setlocalversion |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
