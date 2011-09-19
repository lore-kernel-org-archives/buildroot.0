From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:53:23 +0200
Subject: [Buildroot] [PATCH 20/21] dependencies: add rsync as a required
	dependency
In-Reply-To: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <44c7b2b75d887d124e3cc22704723e09bf1fda71.1316464690.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rsync can now be used for overriden package, and will also be used for
other purposes in the future (optimization of toolchain copy time,
etc.).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/dependencies/dependencies.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 74ab213..410f663 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -123,7 +123,7 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python unzip ${DL_TOOLS} ; do
+for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
 	if test $prog = "makeinfo" ; then
-- 
1.7.4.1
