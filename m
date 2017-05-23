From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:39:03 +0200
Subject: [Buildroot] [git commit branch/next] package/c-icap: add optional
	support for openldap
Message-ID: <20170523134044.09F388295F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cea5f5daf446b2edd5fa93bd13f4730bcb23f24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 17f3459..2d8b309 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -13,7 +13,6 @@ C_ICAP_INSTALL_STAGING = YES
 C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
 C_ICAP_CONF_OPTS = \
 	--with-process-mutexes=posix \
-	--without-ldap \
 	--without-perl \
 	--enable-large-files \
 	--enable-ipv6
@@ -42,6 +41,13 @@ else
 C_ICAP_CONF_OPTS += --without-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+C_ICAP_CONF_OPTS += --with-ldap
+C_ICAP_DEPENDENCIES += openldap
+else
+C_ICAP_CONF_OPTS += --without-ldap
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 C_ICAP_CONF_OPTS += --with-zlib
 C_ICAP_DEPENDENCIES += zlib
