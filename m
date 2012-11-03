From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 18:48:03 +0100
Subject: [Buildroot] [PATCH 18/18] netkittelnet: mark as deprecated
In-Reply-To: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0003a7e4a071871640d8d842c6838611bf210ae5.1351964808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is no longer being developed, the FTP is dead, and Debian has
removed it from the distribution.

Also it allows to not worry about adding RPC support through libtirpc
to this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netkittelnet/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index 10eb022..1f11d88 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETKITTELNET
 	bool "netkittelnet"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_NETKITBASE
 	help
 	  Standard Linux telnet client and server.
-- 
1.7.9.5
