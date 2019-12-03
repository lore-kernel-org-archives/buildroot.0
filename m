From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 3 Dec 2019 23:12:38 +0100
Subject: [Buildroot] [git commit] utils/scancpan: follow Perl version
Message-ID: <20191203221714.7695D870DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49b3a66be6c8eb4a64ebc047b33b24b13fb979c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linked to https://git.busybox.net/buildroot/commit?id=01134ca99a2c83932aee42984c81e51cc0428425

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/scancpan | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 16e495bdac..ac5fd5159a 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -488,9 +488,9 @@ use Digest::SHA qw(sha256_hex);
 use Text::Wrap;
 $Text::Wrap::columns = 62;
 
-# Below, 5.028 should be aligned with the version of perl actually
+# Below, 5.030 should be aligned with the version of perl actually
 # bundled in Buildroot:
-die <<"MSG" if $] < 5.028;
+die <<"MSG" if $] < 5.030;
 This script needs a host perl with the same major version as Buildroot target perl.
 
 Your current host perl is:
@@ -498,7 +498,7 @@ Your current host perl is:
     version $]
 
 You may install a local one by running:
-    perlbrew install perl-5.28.0
+    perlbrew install perl-5.30.0
 MSG
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
@@ -961,7 +961,7 @@ in order to work with the right CoreList data.
 
 =head1 LICENSE
 
-Copyright (C) 2013-2018 by Francois Perrad <francois.perrad@gadz.org>
+Copyright (C) 2013-2019 by Francois Perrad <francois.perrad@gadz.org>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
