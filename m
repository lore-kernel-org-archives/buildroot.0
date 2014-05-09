From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 May 2014 15:36:18 +0200
Subject: [Buildroot] [git commit] iptraf-ng: uses fork(), needs MMU
Message-ID: <20140509133645.283F19CB4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf484e3a2cd77bbd57ee1f7c4d93279f4c916910
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iptraf-ng/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
index fa369b3..64e19d2 100644
--- a/package/iptraf-ng/Config.in
+++ b/package/iptraf-ng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IPTRAF_NG
 	bool "iptraf-ng"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	depends on BR2_INET_IPV6
@@ -13,4 +14,5 @@ config BR2_PACKAGE_IPTRAF_NG
 	  IPTraf-ng is a fork of original IPTraf v3.0.0 (http://iptraf.seul.org).
 
 comment "iptraf-ng needs a toolchain w/ IPv6"
+	depends on BR2_USE_MMU
 	depends on !BR2_INET_IPV6
