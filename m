From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Wed,  4 Mar 2020 10:21:02 +0300
Subject: [Buildroot] [PATCH 1/1] package/cups: change datarootdir
Message-ID: <20200304072102.827531-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, buildroot clean '/usr/share/doc' at image-building, including cups datadir(usr/share/doc/cups), which stores cups web-interface.
It results in web-interface will be unavailable on target system.
This patch add --datarootdir=/usr/share/cups to config options. After that cups web-interface work fine.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 package/cups/cups.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index da6778f30a..455da03feb 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -18,6 +18,7 @@ endef
 CUPS_PRE_CONFIGURE_HOOKS += CUPS_RUN_AUTOCONF
 
 CUPS_CONF_OPTS = \
+	--datarootdir=/usr/share/cups \
 	--disable-gssapi \
 	--disable-pam \
 	--libdir=/usr/lib
-- 
2.24.1
