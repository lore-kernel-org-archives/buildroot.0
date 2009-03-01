From: Robert Urban <urban@unix-beratung.de>
Date: Sun, 01 Mar 2009 18:20:50 +0100
Subject: [Buildroot] vtun patch for lzo headers
Message-ID: <49AAC3F2.6050301@unix-beratung.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had to change the "--with-lzo-headers" and add "/lzo" to get configure to
be happy...

buildroot version is svn, copied today.

Rob Urban

-snip-
--- vtun.mk     2009-03-01 18:17:44.785466135 +0100
+++ vtun.mk.patched     2009-03-01 18:17:35.263461892 +0100
@@ -50,7 +50,7 @@
                --mandir=/usr/man \
                --infodir=/usr/info \
                --with-ssl-headers=$(STAGING_DIR)/usr/include/openssl \
-               --with-lzo-headers=$(STAGING_DIR)/usr/include \
+               --with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
                --with-lzo-lib=$(STAGING_DIR)/usr/lib \
        )
        touch $(VTUN_DIR)/.configured
