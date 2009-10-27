From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Oct 2009 14:46:02 +0100
Subject: [Buildroot] [git commit master] netkittelnet: hide package if RPC
	support isn't available in toolchain
Message-ID: <20091027134636.F165E7743E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8d65822f9de145e46194b631a05cba7db68aa879
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netkittelnet/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index 4c82781..5f42dc3 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETKITTELNET
 	bool "netkittelnet"
+	depends on !BR2_INET_RPC
 	select BR2_PACKAGE_NETKITBASE
 	help
 	  Standard Linux telnet client and server.
@@ -7,4 +8,4 @@ config BR2_PACKAGE_NETKITTELNET
 	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
 
 comment "netkittelnet requires a toolchain with RPC support"
-        depends on !BR2_INET_RPC
+	depends on !BR2_INET_RPC
-- 
1.6.3.3
