From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Jul 2014 22:58:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/lftp: inverse the openssl/gnutls
	selection
In-Reply-To: <cover.1406581025.git.yann.morin.1998@free.fr>
References: <cover.1406581025.git.yann.morin.1998@free.fr>
Message-ID: <cab592c4187ed5d711a72400bdbfa831ca5bb968.1406581025.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl is more widely used than gnutls. Other packages prefer openssl
over gnutls and would like to do the select in the opposite direction.

So switch lftp to use openssl by default, and only revert to using
gnutls if explicitly selected by the user.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/lftp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lftp/Config.in b/package/lftp/Config.in
index 6a65edf..fb4ac13 100644
--- a/package/lftp/Config.in
+++ b/package/lftp/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LFTP
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	help
 	  LFTP is a sophisticated ftp/http client, and a file transfer program
 	  supporting a number of network protocols. Like BASH, it has job
-- 
1.9.1
