From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 15:18:03 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/resiprocate:
 resiprocate-apps need openssl
Message-ID: <20210119141349.EEC3883A06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fc8ee105f074fdf5628cae808bb39e975d2347b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes:
http://autobuild.buildroot.net/results/7ac/7ac82a3ac4b06cb5ad44e92548d66a0f79d149a6/

In file included from Server.cxx:19:
../../resip/stack/ssl/Security.hxx:32:10: fatal error: openssl/ssl.h: No such file or directory

clicktoall needs openssl:
https://github.com/resiprocate/resiprocate/blob/resiprocate-1.12/apps/clicktocall/Makefile.am#L16

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2cc6bd748276027745dfe748a28980a55cd3b0d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/resiprocate/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
index ed57e09c1b..509c11ffda 100644
--- a/package/resiprocate/Config.in
+++ b/package/resiprocate/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_RESIPROCATE_REND
 
 config BR2_PACKAGE_RESIPROCATE_APPS
 	bool "resiprocate-apps"
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	help
 	  Build apps clicktocall and sipdial
