From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Dec 2010 14:23:09 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: clarify
	BR2_PACKAGE_BUSYBOX_FULLINSTALL description
Message-ID: <20101221133224.854DF8E1EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7472011ae7a921162ac9dea21c0da231f899b6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly explain what the (default) install target does, so people who
don't know busybox details understands what the option does.

Notice: Busybox can be configured to create hard links or shell wrappers
instead, but by default symlinks are used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 9988178..19c68cd 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -43,7 +43,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.18.1"	if BR2_BUSYBOX_VERSION_1_18_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
-	bool "Run BusyBox's own full installation"
+	bool "Install symlinks to BusyBox applets"
 	default y
 	help
 	  If you want to run BusyBox's own full install for the
-- 
1.7.2.2
