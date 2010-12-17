From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] dependencies: add unzip
Message-ID: <20101217160159.AC2878E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ba62fde481cb312fa35123f4e633f09ed2c50240
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

unzip is needed to uncompress at91bootstrap, so let's add it as a
dependency. This can be discussed, and if we think it shouldn't be a
new dependency, we can also build a host-unzip.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/dependencies/dependencies.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 1aa013f..a152d4b 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -132,7 +132,7 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python svn ; do
+for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python svn unzip ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
 	if test $prog = "makeinfo" ; then
-- 
1.7.2.2
