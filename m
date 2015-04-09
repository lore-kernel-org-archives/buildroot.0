From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 14:14:23 +0200
Subject: [Buildroot] [git commit] radvd: remove stray comment
Message-ID: <20150409121533.4FE0B80753@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f22bffa284cd5fab59ed4c15ca5669824778d589
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 9863553fe8fa16a4d19f652b409a44bb58ef5567 ("packages: all
salute the passing of avr32"), the dependency on !BR2_avr32 was
removed, but not the comment above it which explained why radvd would
not build on AVR32. So now, we have the impression that the comment
applies to the "select BR2_PACKAGE_FLEX" line, which doesn't make
sense.

Therefore, this commit gets rid of the unneeded and confusing comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/radvd/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index 1c60240..c04a8e5 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_RADVD
 	bool "radvd"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INET_IPV6
-	# uClibc too old, does not define ARPHRD_IEEE802154
 	select BR2_PACKAGE_FLEX
 	help
 	  IPv6 Router Advertisement Daemon.
