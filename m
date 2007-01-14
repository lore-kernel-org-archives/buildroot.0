From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sat, 13 Jan 2007 20:20:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pkgconfig
Message-ID: <20070114042058.A1FDD485BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-13 20:20:57 -0800 (Sat, 13 Jan 2007)
New Revision: 17289

Log:
oops, silence some debugging noise


Modified:
   trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh


Changeset:
Modified: trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh	2007-01-14 04:10:14 UTC (rev 17288)
+++ trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh	2007-01-14 04:20:57 UTC (rev 17289)
@@ -17,11 +17,11 @@
 	sed -e "s~\-L/~-L=/~g; s~\-I/~-I=/~g;" |
 	sed -e "s~\-L\=~-L$PKG_CONFIG_SYSROOT~g; s~\-I\=~-I$PKG_CONFIG_SYSROOT~g;"
 then
-	echo "PKG_CONFIG_LIBDIR=$PKG_CONFIG_LIBDIR" >&2
-	echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH" >&2
-	echo "OKAY" >&2;
+	#echo "PKG_CONFIG_LIBDIR=$PKG_CONFIG_LIBDIR" >&2
+	#echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH" >&2
+	#echo "OKAY" >&2;
 	exit 0;
 else
 	echo "pkg-config failed!" >&2
-	exit 1
+	exit $?
 fi
