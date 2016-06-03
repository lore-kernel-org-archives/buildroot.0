From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 14:47:44 +0200
Subject: [Buildroot] [git commit] package/nodejs: add icu support
Message-ID: <20160603124906.40CF1820F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d0702a2bd5643d3fc1ca9500f8222aca1baa443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index b0661ed..0329299 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -17,6 +17,10 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NODEJS_DEPENDENCIES += openssl
 endif
 
+ifeq ($(BR2_PACKAGE_ICU),y)
+NODEJS_DEPENDENCIES += icu
+endif
+
 # nodejs build system is based on python, but only support python-2.6 or
 # python-2.7. So, we have to enforce PYTHON interpreter to be python2.
 define HOST_NODEJS_CONFIGURE_CMDS
@@ -96,6 +100,7 @@ define NODEJS_CONFIGURE_CMDS
 		--without-snapshot \
 		--shared-zlib \
 		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
+		$(if $(BR2_PACKAGE_ICU),--with-intl=system-icu,--with-intl=none) \
 		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
 		--without-dtrace \
 		--without-etw \
