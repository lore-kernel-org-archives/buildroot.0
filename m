From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 19 Feb 2014 16:33:50 +0100
Subject: [Buildroot] [PATCH] infra: Change BR2_HOST_NEEDS_JAVA name
Message-ID: <1392824030-3871-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change BR2_HOST_NEEDS_JAVA to BR2_NEEDS_HOST_JAVA as it makes more
sense.
The host doesn't need Java but Buildroot needs the host to have
Java in order to build the package that select this option.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Config.in                            | 2 +-
 support/dependencies/dependencies.sh | 2 +-
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
-- 
1.8.5.3
