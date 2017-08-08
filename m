From: Arvind Prasanna <arvindprasanna@gmail.com>
Date: Tue,  8 Aug 2017 12:14:05 -0400
Subject: [Buildroot] [PATCH 1/1] Update the ncurses library package names
Message-ID: <1502208845-24891-1-git-send-email-arvindprasanna@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-- Should be libncurses-dev for Debian based distros and ncurses-devel for Redhat based distros.
-- It saves time for the user to look up the actual package name.

Signed-off-by: Arvind Prasanna <arvindprasanna@gmail.com>
---
 support/kconfig/lxdialog/check-lxdialog.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/kconfig/lxdialog/check-lxdialog.sh b/support/kconfig/lxdialog/check-lxdialog.sh
index 3ce0a23..5400aed 100755
--- a/support/kconfig/lxdialog/check-lxdialog.sh
+++ b/support/kconfig/lxdialog/check-lxdialog.sh
@@ -54,7 +54,9 @@ EOF
 	    echo " *** required header files."                            1>&2
 	    echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
 	    echo " *** "                                                  1>&2
-	    echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
+	    echo " *** Install ncurses (libncurses-dev for Debian based"  1>&2
+	    echo " distros and ncurses-devel for Redhat based distros)"   1>&2
+	    echo " and try again."    					  1>&2
 	    echo " *** "                                                  1>&2
 	    exit 1
 	fi
-- 
2.7.4
