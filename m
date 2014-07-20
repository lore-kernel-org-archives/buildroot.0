From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:52:51 +0200
Subject: [Buildroot] [git commit] perl-gdgraph: fix configure
Message-ID: <20140720095257.BEACD9D1CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e266eb5666ae3090096b33a02365dccf7f631163
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see http://autobuild.buildroot.org/results/3e1/3e1698b0523dfa46f5b3ee03a22af820f7342c39/build-end.log

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../perl-gdgraph-01-fix-Makefile-PL.patch          |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

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
