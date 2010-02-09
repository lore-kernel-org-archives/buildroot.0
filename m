From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Tue,  9 Feb 2010 15:45:55 +0100
Subject: [Buildroot] [PATCH] get_linux_config.sh: sets THIS_MINOR to 0 by
	default when processing a
Message-ID: <1265726755-15417-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 scripts/get_linux_config.sh |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/get_linux_config.sh b/scripts/get_linux_config.sh
index 1950e9d..5cd0e37 100755
--- a/scripts/get_linux_config.sh
+++ b/scripts/get_linux_config.sh
@@ -35,6 +35,7 @@ function linux_version()
 	KERNEL=`echo ${KCONFIG} | sed s/.*linux-2.6./linux-2.6./g -`
 	THIS_MAJOR=${KERNEL:10:2}
 	THIS_MINOR=${KERNEL:13}
+	THIS_MINOR=${THIS_MINOR:=0}
 }
 
 # Try to be careful...
-- 
1.6.0.4
