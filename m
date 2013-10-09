From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 23:40:09 +0200
Subject: [Buildroot] [git commit] vtun: needs mmu
Message-ID: <20131009214149.DC77F9B970@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3f8d974ffef0ed1f0f8fcaa8be598acc89163fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vtun/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index fe1f0d0..c1f6d38 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_VTUN
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_USE_MMU # fork()
 	help
 	  Tool for easily creating Virtual Tunnels over TCP/IP networks
 	  with traffic shaping, compression, and encryption.
