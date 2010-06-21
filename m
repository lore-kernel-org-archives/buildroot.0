From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jun 2010 23:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] check-lxdialog.sh: use mktemp
	for temporary file
Message-ID: <20100621210812.1DEEE817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b50fedbcd3f7badd8f33f163162ed4ae6224982e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/lxdialog/check-lxdialog.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/config/lxdialog/check-lxdialog.sh b/package/config/lxdialog/check-lxdialog.sh
index fcef0f5..361866f 100644
--- a/package/config/lxdialog/check-lxdialog.sh
+++ b/package/config/lxdialog/check-lxdialog.sh
@@ -31,7 +31,7 @@ ccflags()
 }
 
 # Temp file, try to clean up after us
-tmp=.lxdialog.tmp
+tmp=$(mktemp)
 trap "rm -f $tmp" 0 1 2 3 15
 
 # Check if we can link to ncurses
-- 
1.7.1
