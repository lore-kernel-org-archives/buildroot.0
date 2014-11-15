From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Nov 2014 12:57:30 +0100
Subject: [Buildroot] [git commit] iputils: fix openssl select
Message-ID: <20141115120034.E025AB5A04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89f3ed6c3a432fd1fd84112a5d016e02b55f9fdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's BR2_PACKAGE_OPENSSL, not BR2_OPENSSL... oops!

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index 456fddf..e9221ad 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IPUTILS
 	bool "iputils"
-	select BR2_OPENSSL if BR2_INET_IPV6
+	select BR2_PACKAGE_OPENSSL if BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	# requires dn_comp (only available in since uclibc 0.9.33)
 	depends on !BR2_avr32
