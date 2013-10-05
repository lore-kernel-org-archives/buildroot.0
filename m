From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 21:11:29 +0200
Subject: [Buildroot] [git commit] ndisc6: needs mmu
Message-ID: <20131005191321.8DA099B92E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1b0e95a245aaa5fe6efe9cd6b9ae6a0fe48c4b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix below build error if !BR2_USE_MMU:

tcpspray.o: In function `tcpspray':
tcpspray.c:(.text+0x4a8): undefined reference to `fork'
collect2: ld returned 1 exit status
make[3]: *** [tcpspray] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ndisc6/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
index 6abe4ce..095b2e8 100644
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -4,6 +4,7 @@ comment "ndisc6 requires a toolchain with IPv6 support"
 config BR2_PACKAGE_NDISC6
 	bool "ndisc6 tools"
 	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  NDisc6 is a small collection of useful tools for IPv6 networking
