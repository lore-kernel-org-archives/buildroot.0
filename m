From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  8 Dec 2012 16:53:08 +0100
Subject: [Buildroot] [PATCH] netatalk : Fix BerkeleyDB library path
In-Reply-To: <CAGduivwRviPJr6p6ypTZn4U-nDX4HQxXOPYE2s7=zzPZPYozjw@mail.gmail.com>
References: <CAGduivwRviPJr6p6ypTZn4U-nDX4HQxXOPYE2s7=zzPZPYozjw@mail.gmail.com>
Message-ID: <1354981988-32415-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fix is needed for the 64bits build because Netatalk will assume the library
are stored in [..]/lib64/ instead of [..]/lib/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/netatalk/netatalk.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 4063b53..23c2a95 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -8,7 +8,7 @@ NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NET
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2

 NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error
-NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
+NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" BDB_LIB=$(STAGING_LIB)/usr/lib
 NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-bdb=$(STAGING_DIR)/usr \
 	--disable-zeroconf \
--
1.7.10.4
