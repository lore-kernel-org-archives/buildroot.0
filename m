From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 23:08:42 +0100
Subject: [Buildroot] [PATCH v5 2/2] toolchain/toolchain-common.in:
 install nscd
In-Reply-To: <1448287096-18606-3-git-send-email-rdkehn@yahoo.com>
References: <1448287096-18606-1-git-send-email-rdkehn@yahoo.com>
 <1448287096-18606-3-git-send-email-rdkehn@yahoo.com>
Message-ID: <20151130230842.12a0851a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Mon, 23 Nov 2015 07:58:16 -0600, Doug Kehn wrote:

> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 6871d8b..a119c9c 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -136,6 +136,10 @@ config BR2_ECLIPSE_REGISTER
>  	  configuration files to make your toolchain appear within
>  	  Eclipse, through the Eclipse Buildroot plugin.
>  
> +config BR2_GLIBC_NSCD
> +	bool "Install nscd"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

If this option were to be used by PATCH 1/2, then it should be
introduced before.

However, it is very useless to add an option that doesn't do anything
at all: if you add this option, it should actually install nscd.

If you want an example on how to do that, look at how the gconv library
installation is implemented. It works fine for both internal and
external toolchains.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
