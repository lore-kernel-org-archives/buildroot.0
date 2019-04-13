From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 21:16:29 +0200
Subject: [Buildroot] [git commit] package/sconeserver: drop unneeded static
 openssl workaround
Message-ID: <20190413191214.2252B8377E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e929b2dc227aea4bfc4aac1e544d988e3e1e8c4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sconeserver can't be built statically since commit
a845798aa8af0535b85ea0e46cc9e8af9d1ffed1

So drop unneeded workaround for statically linking with openssl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sconeserver/sconeserver.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index c160c8bf7c..6914599a21 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -25,9 +25,6 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SCONESERVER_DEPENDENCIES += openssl
 SCONESERVER_CONF_OPTS += --with-ssl
-ifeq ($(BR2_STATIC_LIBS),y)
-SCONESERVER_CONF_ENV += SSL_LIBADD=-lz
-endif
 else
 SCONESERVER_CONF_OPTS += --without-ssl
 endif
