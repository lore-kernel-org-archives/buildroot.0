From: Joe Pruett <joey@clean.q7.com>
Date: Thu, 14 Dec 2006 07:20:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <20061214151220.E687C485C9@busybox.net>
References: <20061214151220.E687C485C9@busybox.net>
Message-ID: <Pine.LNX.4.64.0612140718370.6047@q7.q7.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

great, this fixed the issue i saw last night with a clean svn dir.  i have 
just started over with a clean version and things are looking 
much better...

On Thu, 14 Dec 2006, aldot at uclibc.org wrote:

> Author: aldot
> Date: 2006-12-14 07:12:19 -0800 (Thu, 14 Dec 2006)
> New Revision: 16922
> 
> Log:
> - prerequisites are evaluated immediately, so move the dl rule down below setting the respective variables. Thanks to whirm for noticing this.
> 
> 
> Modified:
>    trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
> ===================================================================
> --- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-12-14 14:32:32 UTC (rev 16921)
> +++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-12-14 15:12:19 UTC (rev 16922)
> @@ -19,13 +19,12 @@
>  	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
>  	-e s/sh2.*/sh/ -e s/sh3.*/sh/ -e s/sh4.*/sh/")
>  
> +include toolchain/kernel-headers/kernel-headers-new.makefile
> +include toolchain/kernel-headers/kernel-headers-old.makefile
>  
>  $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
>  	$(WGET) -P $(DL_DIR) $(LINUX_HEADERS_SITE)/$(LINUX_HEADERS_SOURCE)
>  
> -include toolchain/kernel-headers/kernel-headers-new.makefile
> -include toolchain/kernel-headers/kernel-headers-old.makefile
> -
>  kernel-headers: $(LINUX_HEADERS_DIR)/.configured
>  
>  kernel-headers-source: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
