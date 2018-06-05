From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 22:20:18 +0200
Subject: [Buildroot] [git commit] dependencies.sh: add perl autodie for whois
Message-ID: <20180605203710.C87CC83B95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc5553d2ce1d333cbecac563d2c55525aa8e14ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add dependency on perl autodie if whois package is selected

Fixes:
 - http://autobuild.buildroot.net/results/4d2ca14580cbc73f94e86ee834fac6d2541298ec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index f98678973b..e570a9ee1a 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -256,6 +256,10 @@ if grep -q ^BR2_PACKAGE_MPV=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules Math::BigRat"
 fi
 
+if grep -q ^BR2_PACKAGE_WHOIS=y $BR2_CONFIG ; then
+    required_perl_modules="$required_perl_modules autodie"
+fi
+
 # This variable will keep the modules that are missing in your system.
 missing_perl_modules=""
 
