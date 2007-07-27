From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 27 Jul 2007 10:25:42 +0200
Subject: [Buildroot] Avoiding rebuild of $(TARGET_DIR)/usr/bin/ldd
Message-ID: <1185524742.12803.13.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$(TARGET_DIR)/usr/bin/ldd gets regenerated each load.
When I study the output of "make -d", it gets rebuilt
because of 'gcc'.

I did the following to get rid of the rebuild, but I am not
sure it is correct.

Comments?


Index: toolchain/uClibc/uclibc.mk
===================================================================
--- toolchain/uClibc/uclibc.mk  (revision 19234)
+++ toolchain/uClibc/uclibc.mk  (arbetskopia)
@@ -345,7 +345,7 @@
                install_runtime
        touch -c $@
 
-$(TARGET_DIR)/usr/bin/ldd: gcc
+$(TARGET_DIR)/usr/bin/ldd: $(TARGET_CROSS)gcc
        $(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
                CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
                PREFIX=$(TARGET_DIR) utils install_utils


Best Regards
Ulf Samuelsson
