From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:27:24 +0100
Subject: [Buildroot] [git commit] sysvinit: depend on SysV selected as init
	system.
Message-ID: <20140113223524.1E1239C4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3124d6a47284e0a70da19241dfe4671b5b2bbbb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to prevent sysvinit and systemd to be selected at the same
time, sysvinit can now only be selected if SysV is chosen as init
system.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index 34ec391..d91c643 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SYSVINIT
 	bool "sysvinit"
+	depends on BR2_INIT_SYSV
 	help
 	  /sbin/init - parent of all processes
 
