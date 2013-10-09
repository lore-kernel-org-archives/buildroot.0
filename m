From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:34:58 +0200
Subject: [Buildroot] [git commit] udpcast: needs mmu
Message-ID: <20131009203637.C19619B9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bccd260fa96d2848a6161166ddc95fe7b5344ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udpcast/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index cb817a9..cae27bd 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_UDPCAST
 	bool "udpcast"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  A multicast protocol implementation which happens to
 	  be very handy for imaging drives over the network.
