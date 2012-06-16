From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 16 Jun 2012 22:14:56 +0200
Subject: [Buildroot] [git commit] hiawatha: fix bug #5276 and bump to
	version 8.4
Message-ID: <20120616203821.9F59896F46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c1ad3099242bb4ddc5ade87e6a8e4239d68f5cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix bug #5276 by disabling IPv6 when the toolchain lacks it.
It builds fine even if it's enabled but it probably doesn't work fine.

Also bump to version 8.4:
* MaxServerLoad option added.
* Bugfix: invalid reverse proxy request when URL parameters are present.
* PolarSSL updated to version 1.1.4.
* Small bugfixes and improvements.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hiawatha/hiawatha.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 647c1e1..941ee8d 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -1,4 +1,4 @@
-HIAWATHA_VERSION = 8.3
+HIAWATHA_VERSION = 8.4
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files/
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
@@ -7,6 +7,7 @@ HIAWATHA_DEPENDENCIES += polarssl
 endif
 
 HIAWATHA_CONF_OPT += \
+	$(if $(BR2_INET_IPV6),,-DENABLE_IPV6=OFF) \
 	-DENABLE_TOOLKIT=OFF \
 	-DENABLE_XSLT=OFF \
 	-DCONFIG_DIR=/etc/hiawatha \
