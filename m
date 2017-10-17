From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 08:47:22 +0200
Subject: [Buildroot] [git commit] package/automake: bump version to 1.15.1
Message-ID: <20171017064003.A5D80802DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5186f1e5cbe01807f40737b8a27fc51d78358a9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-port-to-perl-5.22-and-later.patch         | 34 ----------------------
 package/automake/automake.hash                     |  2 +-
 package/automake/automake.mk                       |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/automake/0002-port-to-perl-5.22-and-later.patch b/package/automake/0002-port-to-perl-5.22-and-later.patch
deleted file mode 100644
index 207039b..0000000
--- a/package/automake/0002-port-to-perl-5.22-and-later.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 13f00eb4493c217269b76614759e452d8302955e Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 31 Mar 2016 16:35:29 -0700
-Subject: [PATCH] automake: port to Perl 5.22 and later
-
-Without this change, Perl 5.22 complains "Unescaped left brace in
-regex is deprecated" and this is planned to become a hard error in
-Perl 5.26.  See:
-http://search.cpan.org/dist/perl-5.22.0/pod/perldelta.pod#A_literal_%22{%22_should_now_be_escaped_in_a_pattern
-* bin/automake.in (substitute_ac_subst_variables): Escape left brace.
-
-[Backported from:
- http://git.savannah.gnu.org/cgit/automake.git/commit/?id=13f00eb4493c217269b76614759e452d8302955e]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- bin/automake.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bin/automake.in b/bin/automake.in
-index a3a0aa3..2c8f31e 100644
---- a/bin/automake.in
-+++ b/bin/automake.in
-@@ -3878,7 +3878,7 @@ sub substitute_ac_subst_variables_worker
- sub substitute_ac_subst_variables
- {
-   my ($text) = @_;
--  $text =~ s/\${([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
-+  $text =~ s/\$[{]([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
-   return $text;
- }
- 
--- 
-2.7.4
-
diff --git a/package/automake/automake.hash b/package/automake/automake.hash
index 83aca90..38c9564 100644
--- a/package/automake/automake.hash
+++ b/package/automake/automake.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9908c75aabd49d13661d6dcb1bc382252d22cc77bf733a2d55e87f2aa2db8636  automake-1.15.tar.xz
+sha256 af6ba39142220687c500f79b4aa2f181d9b24e4f8d8ec497cea4ba26c64bedaf  automake-1.15.1.tar.xz
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 88c4fb3..2703377 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.15
+AUTOMAKE_VERSION = 1.15.1
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPL-2.0+
