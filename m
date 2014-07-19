From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Jul 2014 22:54:04 +0200
Subject: [Buildroot] [PATCH] perl-gdgraph: fix configure
Message-ID: <1405803244-31600-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.org/results/3e1/3e1698b0523dfa46f5b3ee03a22af820f7342c39/build-end.log

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-gdgraph-01-fix-Makefile-PL.patch          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/perl-gdgraph/perl-gdgraph-01-fix-Makefile-PL.patch

diff --git a/package/perl-gdgraph/perl-gdgraph-01-fix-Makefile-PL.patch b/package/perl-gdgraph/perl-gdgraph-01-fix-Makefile-PL.patch
new file mode 100644
index 0000000..e95a64e
--- /dev/null
+++ b/package/perl-gdgraph/perl-gdgraph-01-fix-Makefile-PL.patch
@@ -0,0 +1,24 @@
+partial revert to 1.47 in order to work with an old perl 5.10.1
+
+With old ExtUtils::MakeMaker, AUTHOR takes a string/number not a ARRAY reference.
+See http://api.metacpan.org/source/RUZ/GDGraph-1.48/CHANGES
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile.PL
+===================================================================
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -19,11 +19,7 @@
+ 
+         ($] >= 5.005 ?
+             ('ABSTRACT'	    => 'Produces charts with GD',
+-             'AUTHOR'       => [
+-                 'Martien Verbruggen <mgjv@tradingpost.com.au>',
+-                 'Benjamin Warfield <bwarfield@cpan.org>',
+-                 'Ruslan Zakirov <Ruslan.Zakirov@gmail.com>',
+-            ]
++             'AUTHOR'	    => 'Martien Verbruggen <mgjv@tradingpost.com.au>',
+             ):()
+         ),
+ 
-- 
1.9.1
