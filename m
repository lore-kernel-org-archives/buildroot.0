From: Luigi 'Comio' Mantellini <luigi.mantellini@idf-hit.com>
Date: Sun, 22 Jun 2008 12:25:44 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20080621194717.98BEF3C725@busybox.net>
References: <20080621194717.98BEF3C725@busybox.net>
Message-ID: <1214130344.2605.8.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ciao,

why do we need this?

thanks,

luigi
On sab, 2008-06-21 at 12:47 -0700, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-06-21 12:47:17 -0700 (Sat, 21 Jun 2008)
> New Revision: 22463
> 
> Log:
> toolchain/gcc: use --disable-decimal-float for 4.3.x
> 
> 
> Modified:
>    trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
> ===================================================================
> --- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-06-20 21:45:27 UTC (rev 22462)
> +++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-06-21 19:47:17 UTC (rev 22463)
> @@ -141,6 +141,10 @@
>  EXTRA_GCC1_CONFIG_OPTIONS+=--without-headers
>  endif
>  
> +ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
> +GCC_DECIMAL_FLOAT:=--disable-decimal-float
> +endif
> +
>  HOST_SOURCE+=gcc-source
>  
>  $(DL_DIR)/$(GCC_SOURCE):
> @@ -211,6 +215,7 @@
>  		$(DISABLE_NLS) \
>  		$(THREADS) \
>  		$(MULTILIB) \
> +		$(GCC_DECIMAL_FLOAT) \
>  		$(SOFT_FLOAT_CONFIG_OPTION) \
>  		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
>  		$(EXTRA_GCC_CONFIG_OPTIONS) \
> @@ -284,6 +289,7 @@
>  		$(DISABLE_NLS) \
>  		$(THREADS) \
>  		$(MULTILIB) \
> +		$(GCC_DECIMAL_FLOAT) \
>  		$(SOFT_FLOAT_CONFIG_OPTION) \
>  		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
>  		$(GCC_USE_SJLJ_EXCEPTIONS) \
> @@ -429,6 +435,7 @@
>  		$(DISABLE_NLS) \
>  		$(THREADS) \
>  		$(MULTILIB) \
> +		$(GCC_DECIMAL_FLOAT) \
>  		$(SOFT_FLOAT_CONFIG_OPTION) \
>  		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
>  		$(GCC_USE_SJLJ_EXCEPTIONS) \
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
     ______       Luigi Mantellini
   .'______'.     R&D - Software
  (.'      '.)    Industrie Dial Face S.p.A.
  ( :=----=: )    Via Canzo, 4
  ('.______.')    20068 Peschiera Borromeo (MI), Italy
   '.______.'     Tel.: +39 02 5167 2813
                  Fax:  +39 02 5167 2459
Ind.  Dial Face   Email: luigi.mantellini at idf-hit.com
www.idf-hit.com   GPG fingerprint: 3DD1 7B71 FBDF 6376 1B4A
                                   B003 175F E979 907E 1650
