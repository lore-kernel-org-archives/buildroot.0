From: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Date: Wed, 19 Sep 2012 18:43:17 +0200
Subject: [Buildroot] [PATCH] use a more portable syntax for mktemp. fixes
 build problem under MacOS X
Message-ID: <20120919164317.GA20160@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Developers,
following patch might be useful, when using buildroot on MacOS X.

Signed-off-by: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
---
 support/kconfig/lxdialog/check-lxdialog.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/lxdialog/check-lxdialog.sh b/support/kconfig/lxdialog/check-lxdialog.sh
index 969cd4c..fb4d90b 100644
--- a/support/kconfig/lxdialog/check-lxdialog.sh
+++ b/support/kconfig/lxdialog/check-lxdialog.sh
@@ -33,7 +33,7 @@ ccflags()
 }
 
 # Temp file, try to clean up after us
-tmp=$(mktemp)
+tmp=$(mktemp -t yyy)
 trap "rm -f $tmp" 0 1 2 3 15
 
 # Check if we can link to ncurses
-- 
1.7.11.1
