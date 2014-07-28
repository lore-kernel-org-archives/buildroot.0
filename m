From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 23:06:44 +0200
Subject: [Buildroot] [git commit] package/lftp: inverse the openssl/gnutls
	selection
Message-ID: <20140728212428.906119D2EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c83b5b86fa2bd43e42a5578436bff20ced76f55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl is more widely used than gnutls. Other packages prefer openssl
over gnutls and would like to do the select in the opposite direction.

So switch lftp to use openssl by default, and only revert to using
gnutls if explicitly selected by the user.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lftp/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
