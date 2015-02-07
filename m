From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:15:08 +0100
Subject: [Buildroot] [git commit] util-linux: add missing indirect
	dependency on !avr32 for setpriv
Message-ID: <20150207202910.66B898046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84a4603cb00ec6fdcdecf77703ffb8874f74f1c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 55c10f2..1b475d4 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -216,6 +216,7 @@ config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
+	depends on !BR2_avr32 # libcap-ng
 	select BR2_PACKAGE_LIBCAP_NG
 	help
 	  Run a program with different Linux privilege settings
