From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Mar 2008 17:56:49 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
In-Reply-To: <20080329162316.C78283C51A@busybox.net> (nkukard@uclibc.org's
	message of "Sat\, 29 Mar 2008 09\:23\:16 -0700 \(PDT\)")
References: <20080329162316.C78283C51A@busybox.net>
Message-ID: <87k5jl79ke.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nkukard" == nkukard  <nkukard@uclibc.org> writes:

 nkukard> Author: nkukard
 nkukard> Date: 2008-03-29 09:23:16 -0700 (Sat, 29 Mar 2008)
 nkukard> New Revision: 21558

 nkukard> Log:
 nkukard> * Fixed uClibc sub-x86 arch selection


 nkukard> Modified:
 nkukard>    trunk/buildroot/toolchain/uClibc/uclibc.mk


 nkukard> Changeset:
 nkukard> Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
 nkukard> ===================================================================
 nkukard> --- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-03-29 16:07:46 UTC (rev 21557)
 nkukard> +++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-03-29 16:23:16 UTC (rev 21558)
 nkukard> @@ -353,7 +353,31 @@
 nkukard>  endif
 nkukard>  ifeq ($(BR2_x86_i586),y)
 nkukard>  	$(SED) 's,# CONFIG_586 is not set,CONFIG_586=y,g' $(UCLIBC_DIR)/.oldconfig
 nkukard> -endif
 nkukard> +endif 
 nkukard> +ifeq ($(BR2_x86_pentium_mmx),y)
 nkukard> +	$(SED) 's,# CONFIG_586MMX is not set,CONFIG_586MMX=y,g' $(UCLIBC_DIR)/.oldconfig
 nkukard> +endif 
 nkukard> +ifeq ($(BR2_x86_pentium2),y)
 nkukard> +	$(SED) 's,# CONFIG_PENTIUMII is not set,CONFIG_PENTIUMII=y,g' $(UCLIBC_DIR)/.oldconfig
 nkukard> +endif 
 nkukard> +ifeq ($(BR2_x86_pentium3),y)
 nkukard> +	$(SED) 's,# CONFIG_PENTIUMIII is not set,CONFIG_PENTIUMIII=y,g' $(UCLIBC_DIR)/.oldconfig
 nkukard> +endif 
 nkukard> +ifeq ($(BR2_x86_pentium4),y)
 nkukard> +	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
 nkukard> +endif 
 nkukard> +ifeq ($(BR2_x86_pentium_m),y)
 nkukard> +	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
 nkukard> +endif 
 nkukard> +ifeq ($(BR2_x86_pentiumpro),y)
 nkukard> +	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig

That seems wrong. Should probably be CONFIG_PENTIUMII instead.

-- 
Bye, Peter Korsgaard
