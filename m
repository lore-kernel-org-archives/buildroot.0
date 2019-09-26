From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:11:58 +0200
Subject: [Buildroot] [git commit branch/2019.08.x]
 support/dependencies/dependencies.sh: check for JSON:PP Perl module
Message-ID: <20190926090738.7B29C7FF3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0ce55929edee77848a77b4f1a74c3789029a907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

The JSON::PP Perl module is used at build time by the webkitgtk and
wpewebkit packages.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e0c879509d936c003eb1f4bd497bc86f45829322)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
