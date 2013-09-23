From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Sep 2013 09:35:18 +0200
Subject: [Buildroot] [git commit] iputils: needs mmu
Message-ID: <20130923074447.4C6159B845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf22677b61c8b1760ba96c4ba9b75b5db853e971
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iputils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index 0c77b5f..d4d2829 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IPUTILS
 	bool "iputils"
 	select BR2_OPENSSL if BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	help
 	  This package is set of small useful utilities for Linux networking.
 	  It includes complete versions of ping, traceroute, etc.
