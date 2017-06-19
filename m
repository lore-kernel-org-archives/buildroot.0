From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 19 Jun 2017 15:25:13 +0200
Subject: [Buildroot] [PATCH 1/1] fcgiwrap: Disable -Werror in CFLAGS set by
	configure.
Message-ID: <20170619132513.11518-1-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fcgiwrap's configure script appends -Werror to AM_CFLAGS, then use it
to build the package.  This is an issue when Buildroot supports a new
compiler version and this version makes some warnings appear.
Luckily, one can provide CFLAGS=-Wno-error to the configure script so
it appends -Wno-error to AM_CFLAGS.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/fcgiwrap/fcgiwrap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
index dd74c1ef72..c080a1ae49 100644
--- a/package/fcgiwrap/fcgiwrap.mk
+++ b/package/fcgiwrap/fcgiwrap.mk
@@ -10,6 +10,7 @@ FCGIWRAP_DEPENDENCIES = host-pkgconf libfcgi
 FCGIWRAP_LICENSE = MIT
 FCGIWRAP_LICENSE_FILES = COPYING
 FCGIWRAP_AUTORECONF = YES
+FCGIWRAP_CONF_OPTS += CFLAGS=-Wno-error
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 FCGIWRAP_DEPENDENCIES += systemd
-- 
2.11.0
