From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 23:40:23 +0200
Subject: [Buildroot] [git commit] xl2tp: needs mmu
Message-ID: <20131009214150.0DA899B9AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffc959385031d8e8003e7fdb6766cddb96d9afbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xl2tp/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/xl2tp/Config.in b/package/xl2tp/Config.in
index 8f9d9b1..7e2d2f6 100644
--- a/package/xl2tp/Config.in
+++ b/package/xl2tp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XL2TP
 	bool "xl2tp"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  Layer 2 Tunnelling Protocol (RFC2661).
