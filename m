From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jul 2016 14:20:53 +0200
Subject: [Buildroot] [PATCH] iozone: depends on toolchain with NPTL
 support
In-Reply-To: <20160731120545.GA18680@waldemar-brodkorb.de>
References: <20160731120545.GA18680@waldemar-brodkorb.de>
Message-ID: <20160731142053.4cd34294@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 14:05:45 +0200, Waldemar Brodkorb wrote:

> @@ -1,9 +1,12 @@
>  config BR2_PACKAGE_IOZONE
>  	bool "iozone"
>  	depends on BR2_USE_MMU # fork()

Since you have a dependency on BR2_USE_MMU here...

> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	help
>  	  IOzone is a filesystem benchmark tool.
>  	  The benchmark generates and measures a variety of file operations
>  
>  	  http://www.iozone.org/
> +
> +comment "iozone needs a toolchain w/ NPTL"

it should be replicated here as well.

> +        depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL

I've fixed this, and also added another patch that removes dead code in
the .mk that was handling the !thread case.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
