From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Oct 2011 07:20:29 +0200
Subject: [Buildroot] [git commit] barebox: add 2011.10,
	mark 2011.08 as deprecated
Message-ID: <20111010075224.9E9E78E305@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce1940ddea7d82e5da1e0b8c14395a1302d29086
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 71d530f..8dfaeb2 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,16 +8,20 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2011_09
+	default BR2_TARGET_BAREBOX_2011_10
 	help
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_2011_08
+	depends on BR2_DEPRECATED
 	bool "2011.08"
 
 config BR2_TARGET_BAREBOX_2011_09
 	bool "2011.09"
 
+config BR2_TARGET_BAREBOX_2011_10
+	bool "2011.10"
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -37,6 +41,7 @@ config BR2_TARGET_BAREBOX_VERSION
 	string
 	default "2011.08.0"	if BR2_TARGET_BAREBOX_2011_08
 	default "2011.09.0"	if BR2_TARGET_BAREBOX_2011_09
+	default "2011.10.0"	if BR2_TARGET_BAREBOX_2011_10
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
