From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 12 Feb 2013 12:48:46 +0100
Subject: [Buildroot] [PATCH] dependencies: suggest package name if hg is
	missing.
Message-ID: <1360669726-30288-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/dependencies/dependencies.sh |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index acba57c..1dad6eb 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -140,6 +140,8 @@ for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio p
 	    /bin/echo -e "msgfmt is usually part of the gettext package in your distribution\n"
 	elif test $prog = "svn" ; then
 	    /bin/echo -e "svn is usually part of the subversion package in your distribution\n"
+	elif test $prog = "hg" ; then
+	    /bin/echo -e "hg is usually part of the mercurial package in your distribution\n"
 	else
 	    /bin/echo -e "\n"
 	fi
-- 
1.7.10.4
