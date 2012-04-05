From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Apr 2012 14:43:59 +0200
Subject: [Buildroot] [git commit] bind: needs MMU
Message-ID: <20120405124505.A9C1296A13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55c181fd0cb2d93b82564c5f9fcfb9adc13fd41b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bind/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 9b9c7ee..2944f1f 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_BIND
 	bool "bind"
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  BIND (Berkeley Internet Name Domain) is an implementation of
 	  the Domain Name System (DNS) protocols and provides an openly
