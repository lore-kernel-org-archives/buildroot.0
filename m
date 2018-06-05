From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Jun 2018 20:13:47 +0200
Subject: [Buildroot] [PATCH 1/1] dependencies.sh: add perl autodie for whois
Message-ID: <20180605181347.1992-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add dependency on perl autodie if whois package is selected

Fixes:
 - http://autobuild.buildroot.net/results/4d2ca14580cbc73f94e86ee834fac6d2541298ec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
 
-- 
2.14.1
