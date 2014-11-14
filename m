From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 15:10:24 +0100
Subject: [Buildroot] [PATCH 02/10] dash: bump to 0.5.8-2
In-Reply-To: <54660AB0.6050905@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 14 Nov 2014 10:59:12 -0300")
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-3-git-send-email-gustavo@zacarias.com.ar>
 <20141114141548.55205c95@free-electrons.com>
 <87bno9hpfv.fsf@dell.be.48ers.dk>
 <20141114144256.7486638c@free-electrons.com>
 <87389lhoyb.fsf@dell.be.48ers.dk> <54660AB0.6050905@zacarias.com.ar>
Message-ID: <87lhndg9f3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> Gustavoz, what is the reason for the bump? According to the changelog
 >> the only difference is in the debian packaging (should we also pass
 >> --disable-lineno?)

 > Many tiny fixes, it's not only that.
 > I think we could consider it a security fix even if there's no
 > know/public vulnerability yet:
 > https://cygwin.com/ml/cygwin-announce/2014-09/msg00043.html

But isn't this changelog against 5.7? We already have 5.8-1.

E.G.

wget -q http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/d/dash/dash_0.5.8-1.diff.gz
wget -q http://snapshot.debian.org/archive/debian/20141022T163236Z/pool/main/d/dash/dash_0.5.8-2.diff.gz
gunzip dash_0.5.8-*
diff -u dash_0.5.8-*
--- dash_0.5.8-1.diff   2014-10-01 19:10:25.000000000 +0200
+++ dash_0.5.8-2.diff   2014-10-22 18:36:50.000000000 +0200
@@ -85,7 +85,14 @@
 +fi
 --- dash-0.5.8.orig/debian/changelog
 +++ dash-0.5.8/debian/changelog
-@@ -0,0 +1,1837 @@
+@@ -0,0 +1,1844 @@
++dash (0.5.8-2) experimental; urgency=medium
++
++  * debian/rules: pass --disable-lineno option to configure (thx Sven
++    Joachim, closes: #766048).
++
++ -- Gerrit Pape <pape@smarden.org>  Mon, 20 Oct 2014 17:46:03 +0000
++
 +dash (0.5.8-1) experimental; urgency=medium
 +
 +  * new upstream release (closes: #598238).
@@ -4180,7 +4187,7 @@
 +"d. bash, tcsh)."
 --- dash-0.5.8.orig/debian/rules
 +++ dash-0.5.8/debian/rules
-@@ -0,0 +1,108 @@
+@@ -0,0 +1,109 @@
 +#!/usr/bin/make -f
 +
 +CC =gcc
@@ -4226,7 +4233,8 @@
 +      touch configure
 +      (cd build-tmp && CC='$(CC)' \
 +        CFLAGS='$(CFLAGS)' CPPFLAGS='$(CPPFLAGS)' LDFLAGS='$(LDFLAGS)' \
-+        exec ../configure --enable-fnmatch --host='$(DEB_HOST_GNU_TYPE)')
++        exec ../configure --enable-fnmatch --disable-lineno \
++          --host='$(DEB_HOST_GNU_TYPE)')
 +      touch configure-stamp
 +
 +build: deb-checkdir build-stamp


-- 
Bye, Peter Korsgaard 
