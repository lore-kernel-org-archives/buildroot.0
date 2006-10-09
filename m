From: Fredrik Roubert <roubert@df.lth.se>
Date: Mon, 9 Oct 2006 16:29:54 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <20061009114134.C2C4E485D4@busybox.net>
References: <20061009114134.C2C4E485D4@busybox.net>
Message-ID: <20061009142954.GL4171@igloo.df.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon 09 Oct 13:41 CEST 2006, aldot at uclibc.org wrote:

> +	 $(MAKE) INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install)

Unless ARCH is set, the wrong asm header files will be used. The
attached patch fixes that.

Cheers // Fredrik Roubert

-- 
Visserij 192  |  +32 473 344527 / +46 708 776974
BE-9000 Gent  |  http://www.df.lth.se/~roubert/
-------------- next part --------------
diff -ur buildroot-20061006-16345/toolchain/kernel-headers/kernel-headers.mk buildroot/toolchain/kernel-headers/kernel-headers.mk
--- buildroot-20061006-16345/toolchain/kernel-headers/kernel-headers.mk	2006-10-09 15:29:15.000000000 +0200
+++ buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-10-09 15:28:06.000000000 +0200
@@ -133,7 +133,7 @@
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
 	(cd $(LINUX_HEADERS_UNPACK_DIR) ; \
-	 $(MAKE) INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install)
+	 $(MAKE) ARCH=$(ARCH) INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install)
 	touch $(LINUX_HEADERS_DIR)/.configured
 else
 # the sanitized kernel-headers
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 303 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061009/66e33e05/attachment.pgp 
