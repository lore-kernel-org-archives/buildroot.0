From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 23:02:05 +0200
Subject: [Buildroot] [PATCH v2 1/2] linux-headers: Allow building a
 4.8-rc kernel
In-Reply-To: <1473696955-24297-1-git-send-email-festevam@gmail.com>
References: <1473696955-24297-1-git-send-email-festevam@gmail.com>
Message-ID: <20160912230205.6f8f9270@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 13:15:54 -0300, Fabio Estevam wrote:

> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 7fea748..8601eff 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -86,6 +86,10 @@ choice
>  		bool "Linux 4.7.x kernel headers"
>  		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
>  
> +	config BR2_KERNEL_HEADERS_4_8
> +		bool "Linux 4.8-rc kernel headers"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8

Adding this is not good if you don't update the
BR2_DEFAULT_KERNEL_HEADERS option. With this change, if an user selects
BR2_KERNEL_HEADERS_4_8, he will get a build error as it will try to
download linux-.tar.bz2.

So I've dropped this chunk. It will be added once 4.8 final is
released, together with the BR2_DEFAULT_KERNEL_HEADERS change.

I've also updated the commit log to be more explanatory.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
