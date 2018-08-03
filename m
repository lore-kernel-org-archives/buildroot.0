From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Aug 2018 00:06:19 +0200
Subject: [Buildroot] [PATCH 2/3] support/dependencies: also check for
 flex+bison
In-Reply-To: <cover.1533333972.git.yann.morin.1998@free.fr>
References: <cover.1533333972.git.yann.morin.1998@free.fr>
Message-ID: <618683c996f71c0dd6360b3c027406e91a96ab61.1533333972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 58c34d880f..09d0450688 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -161,7 +161,11 @@ fi
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in patch perl tar wget cpio python unzip rsync bc ${DL_TOOLS} ; do
+required_progs="
+    patch perl tar wget cpio python unzip rsync bc bison flex
+    ${DL_TOOLS}
+"
+for prog in ${required_progs} ; do
 	if ! which $prog > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
-- 
2.14.1
