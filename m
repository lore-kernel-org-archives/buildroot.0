From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:39:39 +0200
Subject: [Buildroot] [git commit] package/c-icap: add optional support for
	libmemcached
Message-ID: <20170601202854.4721F807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95359bb43c25568917b015895063f61db9fd79ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for libmemcached was added in 2014:
https://sourceforge.net/p/c-icap/code/1103/#diff-2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 750b231..e32e0dc 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -41,6 +41,13 @@ else
 C_ICAP_CONF_OPTS += --without-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMEMCACHED),y)
+C_ICAP_CONF_OPTS += --with-memcached
+C_ICAP_DEPENDENCIES += libmemcached
+else
+C_ICAP_CONF_OPTS += --without-memcached
+endif
+
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 C_ICAP_CONF_OPTS += --with-ldap
 C_ICAP_DEPENDENCIES += openldap
