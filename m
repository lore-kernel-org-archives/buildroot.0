From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 16:18:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/x264: disable CLI tool if no MMU
In-Reply-To: <20160827140238.28617-1-bernd.kuhls@t-online.de>
References: <20160827140238.28617-1-bernd.kuhls@t-online.de>
Message-ID: <20160827161807.199f6b34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Aug 2016 16:02:38 +0200, Bernd Kuhls wrote:

>  config BR2_PACKAGE_X264_CLI
>  	bool "CLI"
> +	depends on BR2_USE_MMU # madvise()

The main BR2_PACKAGE_X264 option already has:

config BR2_PACKAGE_X264
        bool "x264"
        depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX # madvise()

So perhaps this is wrong, and should be replaced by your BR2_USE_MMU
dependency on just the CLI sub-option?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
