From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 8 Jul 2008 22:04:26 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <20080708101305.8702C3C697@busybox.net>
References: <20080708101305.8702C3C697@busybox.net>
Message-ID: <20080708120426.GB30117@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 08, 2008 at 03:13:05AM -0700, ulf at uclibc.org wrote:
> Author: ulf
> Date: 2008-07-08 03:13:04 -0700 (Tue, 08 Jul 2008)
> New Revision: 22687
> 
> Log:
> Revert patch which breaks AVR32 build
> 
> Modified:
>    trunk/buildroot/package/openssl/openssl.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/openssl/openssl.mk
> ===================================================================
> --- trunk/buildroot/package/openssl/openssl.mk	2008-07-08 10:09:28 UTC (rev 22686)
> +++ trunk/buildroot/package/openssl/openssl.mk	2008-07-08 10:13:04 UTC (rev 22687)
> @@ -40,6 +40,7 @@
>  endif
>  	$(SED) '/CFLAG=/s,/;, $(shell echo '$(TARGET_CFLAGS)' | sed -e 's/\//\\\\\//g')/;,' \
>  		$(OPENSSL_DIR)/Configure
> +	$(CONFIG_UPDATE) $(OPENSSL_DIR)
>  	touch $@
>  
>  $(OPENSSL_DIR)/Makefile: $(OPENSSL_DIR)/.unpacked

Please, did you test before reverting this?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
