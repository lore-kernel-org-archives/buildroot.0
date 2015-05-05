From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 17:45:00 +0200
Subject: [Buildroot] [PATCH] arch/Config.in.xtensa: provide BR2_ENDIAN
	symbol
In-Reply-To: <1430840532-2115-1-git-send-email-jcmvbkbc@gmail.com>
References: <1430840532-2115-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150505174500.24a31bcf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue,  5 May 2015 18:42:12 +0300, Max Filippov wrote:
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  arch/Config.in.xtensa | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Thanks for coming up so quickly with a patch for this!

I think it's important to mention that this is fixing an autobuilder
failure, and put the pointer to the corresponding failure.

> +choice
> +	prompt "Target Architecture Endianness"
> +	depends on BR2_XTENSA_CUSTOM
> +	default BR2_XTENSA_LITTLE_ENDIAN
> +config BR2_XTENSA_LITTLE_ENDIAN
> +	bool "Little endian"
> +config BR2_XTENSA_BIG_ENDIAN
> +	bool "Big endian"
> +endchoice

A little bit of spacing between options would be good I believe.

Other than that, looks good to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
