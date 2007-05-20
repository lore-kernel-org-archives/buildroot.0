From: rafael2k <rafael@riseup.net>
Date: Sun, 20 May 2007 19:27:27 -0300
Subject: [Buildroot] uclibc compilation w/ locale not supported?
In-Reply-To: <200705201708.30037.rafael@riseup.net>
References: <200705201708.30037.rafael@riseup.net>
Message-ID: <200705201927.29565.rafael@riseup.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

w/ this patch i got locale:

diff -u toolchain/uClibc/uclibc.mk.orig toolchain/uClibc/uclibc.mk
--- toolchain/uClibc/uclibc.mk.orig     2007-05-20 18:17:26.000000000 -0300
+++ toolchain/uClibc/uclibc.mk  2007-05-20 18:27:35.000000000 -0300
@@ -189,7 +189,7 @@
        echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.config
 endif
 ifeq ($(BR2_ENABLE_LOCALE),y)
-       
$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=y\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' 
$(UCLIBC_DIR)/.config
+       $(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,g' 
$(UCLIBC_DIR)/.config
 else
        $(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' 
$(UCLIBC_DIR)/.config
 endif


are these options really needed for locale?

thx,
rafael diniz

Em Domingo 20 Maio 2007 17:08, rafael2k escreveu:
> hi all,
> I made a .config for my uclibc 0.9.29, but when i run 'make' inside
> buildroot, it changes my config to:
>
> -UCLIBC_HAS_LOCALE=y
> -# UCLIBC_PREGENERATED_LOCALE_DATA is not set
> -# UCLIBC_HAS_XLOCALE is not set
> +# UCLIBC_HAS_LOCALE is not set
>
>
> thx,
> rafael diniz

-- 
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
Eng. da Computa??o @  Unicamp
R?dio Muda, radiolivre.org, TV Piolho, tvlivre.org, www.midiaindependente.org
Chave PGP: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x2FF86098
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070520/9773a3da/attachment.pgp 
