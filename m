From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:36:00 +0200
Subject: [Buildroot] [git commit] system: make /bin/sh symlink use relative
	path
Message-ID: <20150621073704.7535D8078D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e26ec6e45cb4246353bb4b88fbe718212fc89c61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The symlink created by buildroot for /bin/sh is the full path to
a shell.  This does not match what busybox and other Linux
distributions do with using relative path symlinks. When handling
files on the host system this will point to the host system's shell
if present and not the target shell.

This is fixed by changing the /bin/sh symlink to use a relative path.

Fixes #8161.

[Thomas: minor fixups to the commit log suggested by Yann E. Morin.]

Signed-off-by: Matthew Starr <mstarr@hedonline.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 84cde94..15f0515 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -236,10 +236,10 @@ endchoice # /bin/sh
 
 config BR2_SYSTEM_BIN_SH
 	string
-	default "/bin/busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
-	default "/bin/bash"    if BR2_SYSTEM_BIN_SH_BASH
-	default "/bin/dash"    if BR2_SYSTEM_BIN_SH_DASH
-	default "/bin/zsh"     if BR2_SYSTEM_BIN_SH_ZSH
+	default "busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
+	default "bash"    if BR2_SYSTEM_BIN_SH_BASH
+	default "dash"    if BR2_SYSTEM_BIN_SH_DASH
+	default "zsh"     if BR2_SYSTEM_BIN_SH_ZSH
 
 config BR2_TARGET_GENERIC_GETTY
 	bool "Run a getty (login prompt) after boot"
