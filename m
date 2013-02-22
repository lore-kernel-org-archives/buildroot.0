From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Feb 2013 23:49:44 +0100
Subject: [Buildroot] [git commit] package/vtun: add missing 'depends on' zlib
Message-ID: <20130222224945.5BCFC9AC4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b9e763e161ceb0b4d81a344d10c1a33c1036af7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency on zlib is correctly expresed in vtun.mk,
but was missing from the Config.in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vtun/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index b40de25..7afda9e 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_VTUN
 	bool "vtun - BEWARE: read package/vtun/README.txt before use"
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
 	help
 	  Tool for easily creating Virtual Tunnels over TCP/IP networks
 	  with traffic shaping, compression, and encryption.
