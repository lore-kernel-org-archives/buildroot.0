From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:48:35 +0100
Subject: [Buildroot] [git commit master] netkittelnet: fix typo introduced
	in 8d65822f9d
Message-ID: <20091123124946.02005776A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9ab3ad73324ab6de0c69875a42723a1bda3259b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Netkittelnet needs a toolchain WITH RPC support, not WITHOUT.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netkittelnet/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index 5f42dc3..058d210 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NETKITTELNET
 	bool "netkittelnet"
-	depends on !BR2_INET_RPC
+	depends on BR2_INET_RPC
 	select BR2_PACKAGE_NETKITBASE
 	help
 	  Standard Linux telnet client and server.
-- 
1.6.3.3
