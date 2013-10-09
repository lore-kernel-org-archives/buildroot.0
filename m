From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 23:40:26 +0200
Subject: [Buildroot] [git commit] transmission: needs mmu
Message-ID: <20131009214150.1BA829B970@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2f298cebbd0ac3e0e31aca56e0426c60597104b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 9284075..30314f7 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TRANSMISSION
 	bool "transmission"
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
