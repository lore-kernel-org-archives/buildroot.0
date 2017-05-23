From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:39:23 +0200
Subject: [Buildroot] [git commit branch/next] package/c-icap: add optional
	support for pcre
Message-ID: <20170523134044.13AB4822A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec1c9bf34684746262e7c379f8d4fd5911067b7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for pcre was added in 2014:
https://sourceforge.net/p/c-icap/code/1135/#diff-4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 2d8b309..750b231 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -48,6 +48,13 @@ else
 C_ICAP_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE),y)
+C_ICAP_CONF_OPTS += --with-pcre
+C_ICAP_DEPENDENCIES += pcre
+else
+C_ICAP_CONF_OPTS += --without-pcre
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 C_ICAP_CONF_OPTS += --with-zlib
 C_ICAP_DEPENDENCIES += zlib
