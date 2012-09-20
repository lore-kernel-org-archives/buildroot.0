From: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Date: Thu, 20 Sep 2012 10:02:20 +0200
Subject: [Buildroot] [PATCH] refresh patch used to sync with upstream,
 suggested by Thomas Petazzoni
Message-ID: <20120920080220.GA5031@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

update patch used to sync with upstream kconfig.

Signed-off-by: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
---
 support/kconfig/patches/11-use-mktemp-for-lxdialog.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
index 21ca228..7a731c1 100644
--- a/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
+++ b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
@@ -11,7 +11,7 @@ Index: config/lxdialog/check-lxdialog.sh
  
  # Temp file, try to clean up after us
 -tmp=.lxdialog.tmp
-+tmp=$(mktemp)
++tmp=$(mktemp -t yyy)
  trap "rm -f $tmp" 0 1 2 3 15
  
  # Check if we can link to ncurses
-- 
1.7.11.1
