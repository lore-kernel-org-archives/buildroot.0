From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Sep 2009 09:46:55 +0200
Subject: [Buildroot] [git commit master] netkittelnet: depends on netkitbase
	(and in term RPC support)
Message-ID: <20090919074909.4CBCA776ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f5239c327e303a1470829c641bc2d9e28c819d23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #617

netkittelnet needs netkitbase, which in term needs RPC support in
toolchain, so adjust Kconfig dependencies to ensure this.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    1 +
 package/netkittelnet/Config.in |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index b15e2bb..c8a5e3c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,6 +9,7 @@
 	#487: Make kismet package sexier
 	#527: misc fixes for dnsmasq package
 	#587: Use iptables multipurpose binaries and bump to 1.4.4
+	#617: netkit/inetd requires RPC and fails to build if RPC is disabled
 
 2009.08, Released August 31th, 2009:
 
diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index 4dec880..4c82781 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_NETKITTELNET
 	bool "netkittelnet"
+	select BR2_PACKAGE_NETKITBASE
 	help
 	  Standard Linux telnet client and server.
 
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
+
+comment "netkittelnet requires a toolchain with RPC support"
+        depends on !BR2_INET_RPC
-- 
1.6.3.3
