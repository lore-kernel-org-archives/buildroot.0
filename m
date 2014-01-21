From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 15:39:16 +0100
Subject: [Buildroot] [git commit] wget: bump to version 1.15
Message-ID: <20140121144059.74B909BECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=425649fb32ef39f97bdee07cb3dd1473f7e0bc0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ror-in-texi2pod-intriduced-with-Perl-5.18.patch |   26 --------------------
 package/wget/wget.mk                               |    2 +-
 2 files changed, 1 insertions(+), 27 deletions(-)

diff --git a/package/wget/0001-Fix-error-in-texi2pod-intriduced-with-Perl-5.18.patch b/package/wget/0001-Fix-error-in-texi2pod-intriduced-with-Perl-5.18.patch
deleted file mode 100644
index cf423a3..0000000
--- a/package/wget/0001-Fix-error-in-texi2pod-intriduced-with-Perl-5.18.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 7f43748544f26008d0dd337704f02a6ed3200aaf Mon Sep 17 00:00:00 2001
-From: Dave Reisner <dreisner@archlinux.org>
-Date: Mon, 17 Jun 2013 23:31:46 +0530
-Subject: [PATCH] Fix error in texi2pod intriduced with Perl 5.18
-
----
- doc/ChangeLog   | 5 +++++
- doc/texi2pod.pl | 2 +-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/doc/texi2pod.pl b/doc/texi2pod.pl
-index 86c4b18..9db6de1 100755
---- a/doc/texi2pod.pl
-+++ b/doc/texi2pod.pl
-@@ -291,7 +291,7 @@ while(<$inf>) {
- 	if (defined $1) {
-             my $thing = $1;
-             if ($ic =~ /\@asis/) {
--                $_ = "\n=item $thing\n";
-+                $_ = "\n=item C<$thing>\n";
-             } else {
-                 # Entity escapes prevent munging by the <> processing below.
-                 $_ = "\n=item $ic\&LT;$thing\&GT;\n";
--- 
-1.8.4.rc3
-
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 429fbda..ffdf047 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.14
+WGET_VERSION = 1.15
 WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_LICENSE = GPLv3+
