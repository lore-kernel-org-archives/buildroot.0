From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 21:55:46 +0100
Subject: [Buildroot] [git commit branch/next] infra: Change
	BR2_HOST_NEEDS_JAVA name
Message-ID: <20140219205658.949459CABF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0721c7133022d270e997c0c42ef044b48c5c5943
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Change BR2_HOST_NEEDS_JAVA to BR2_NEEDS_HOST_JAVA as it makes more
sense.
The host doesn't need Java but Buildroot needs the host to have
Java in order to build the package that select this option.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                            |    2 +-
 support/dependencies/dependencies.sh |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 8afd156..c5c8aa8 100644
--- a/Config.in
+++ b/Config.in
@@ -20,7 +20,7 @@ config BR2_EXTERNAL
 
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: xbmc)
-config BR2_HOST_NEEDS_JAVA
+config BR2_NEEDS_HOST_JAVA
 	bool
 
 # Hidden boolean selected by pre-built packages for x86, when they
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a965c68..a8261b3 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -191,7 +191,7 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $BR2_CONFIG ; then
 	done
 fi
 
-if grep -q ^BR2_HOST_NEEDS_JAVA=y $BR2_CONFIG ; then
+if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
 	if ! which java > /dev/null ; then
 		echo >&2
 		echo "You must install 'java' on your build machine" >&2
