From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 16 Apr 2008 08:31:31 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20080415214647.D2C693C53C@busybox.net>
References: <20080415214647.D2C693C53C@busybox.net>
Message-ID: <20080415223131.GB27329@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 15, 2008 at 02:46:47PM -0700, ulf at uclibc.org wrote:
> Author: ulf
> Date: 2008-04-15 14:46:47 -0700 (Tue, 15 Apr 2008)
> New Revision: 21740
> 
> Log:
> Allow build to complete, even if tftpboot is not writeable by user
> 
> Modified:
>    trunk/buildroot/target/linux/Makefile.in.advanced
> 
> 
> Changeset:
> Modified: trunk/buildroot/target/linux/Makefile.in.advanced
> ===================================================================
> --- trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-15 17:10:24 UTC (rev 21739)
> +++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-15 21:46:47 UTC (rev 21740)
> @@ -438,8 +438,8 @@
>  	cp -dpf .config $(TARGET_DIR)/boot/busybox.config
>  
>  /tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
> -	mkdir -p /tftpboot
> -	cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
> +	-mkdir -p /tftpboot
> +	-cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)

I think that's a bad idea. Now you will build the system, the copy
silently fails to run, you will boot your embedded target and wonder why
it behaves the same as before?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
