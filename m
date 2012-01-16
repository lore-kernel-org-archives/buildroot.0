From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Jan 2012 16:25:52 +0100
Subject: [Buildroot] [git commit] linux: remove default for custom kernel
	version
Message-ID: <20120116152942.C1A9A9035A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ffd5ee4e96080051ff5a37c3dc376b0fe66699e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There already is a default kernel version, so it makes little sense to have
a default custom kernel version as well.  This default breaks the 'make
savedefconfig' if we want to force a specific version.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6a40b20..bbef487 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -58,7 +58,6 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "3.2.1"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
