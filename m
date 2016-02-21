From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 11:51:24 +0100
Subject: [Buildroot] [PATCH 3/7] package/cairo: add optional support for lzo
In-Reply-To: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456051888-2047-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When lzo was compiled before, cairo will use it as optional dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/cairo-sphinx | grep NEEDED | sort
[...]
 0x0000000000000001 (NEEDED)             Shared library: [liblzo2.so.2]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cairo/cairo.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 205250d..49cf921 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -142,6 +142,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
 CAIRO_CONF_OPTS += --enable-tee
+ifeq ($(BR2_PACKAGE_LZO),y)
+CAIRO_DEPENDENCIES += lzo
+endif
 else
 CAIRO_CONF_OPTS += --disable-tee
 endif
-- 
2.7.0
