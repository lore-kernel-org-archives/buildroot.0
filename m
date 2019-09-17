From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:36:42 +0200
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 check for JSON:PP Perl module
Message-ID: <20190917203210.2F5098EA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0c879509d936c003eb1f4bd497bc86f45829322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The JSON::PP Perl module is used at build time by the webkitgtk and
wpewebkit packages.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/dependencies.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 3a170cbda6..3f18985435 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -270,6 +270,10 @@ if grep -q ^BR2_PACKAGE_WHOIS=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules autodie"
 fi
 
+if grep -q -E '^BR2_PACKAGE_(WEBKITGTK|WPEWEBKIT)=y' $BR2_CONFIG ; then
+    required_perl_modules="${required_perl_modules} JSON::PP"
+fi
+
 # This variable will keep the modules that are missing in your system.
 missing_perl_modules=""
 
