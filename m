From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 16 May 2020 12:12:42 -0400
Subject: [Buildroot] [PATCH 1/1] package/openssh: add optional dependency on
 audit
Message-ID: <20200516161242.21900-1-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/openssh/openssh.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index d505721..41dbe56 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -32,6 +32,13 @@ endif
 
 OPENSSH_DEPENDENCIES = host-pkgconf zlib openssl
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+OPENSSH_DEPENDENCIES += audit
+OPENSSH_CONF_OPTS += --with-audit=linux
+else
+OPENSSH_CONF_OPTS += --without-audit
+endif
+
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 OPENSSH_DEPENDENCIES += cryptodev-linux
 OPENSSH_CONF_OPTS += --with-ssl-engine
-- 
2.7.4
