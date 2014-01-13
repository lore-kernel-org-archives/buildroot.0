From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:31:20 +0100
Subject: [Buildroot] [git commit] system: fix kconfig warning about
	BR2_PACKAGE_SYSVINIT
Message-ID: <20140113223524.263CB9C424@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cac4fe50a4330f5f08f0484f3dcb82818c609f8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

warning: (BR2_INIT_SYSV) selects BR2_PACKAGE_SYSVINIT which has unmet direct
dependencies (BR2_PACKAGE_BUSYBOX_SHOW_OTHERS && BR2_INIT_SYSV)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 8288335..181a0ac 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -82,6 +82,7 @@ config BR2_INIT_BUSYBOX
 
 config BR2_INIT_SYSV
 	bool "systemV"
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
 	select BR2_PACKAGE_SYSVINIT
 
 config BR2_INIT_SYSTEMD
