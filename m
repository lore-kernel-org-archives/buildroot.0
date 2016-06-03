From: Martin Bark <martin@barkynet.com>
Date: Fri,  3 Jun 2016 11:41:16 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: add icu support
Message-ID: <1464950477-3122-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
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
-- 
2.7.4
