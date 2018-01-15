From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 11:32:38 +0100
Subject: [Buildroot] [PATCH] wolfssl: fix build on ARMV8
In-Reply-To: <1516010110-11590-1-git-send-email-sergio.prado@e-labworks.com>
References: <1516010110-11590-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20180115113238.66aef010@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Jan 2018 07:55:10 -0200, Sergio Prado wrote:

> diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
> index c8ef50a9bc6e..3e661cd26ef4 100644
> --- a/package/wolfssl/wolfssl.mk
> +++ b/package/wolfssl/wolfssl.mk
> @@ -29,10 +29,4 @@ else
>  WOLFSSL_CONF_OPTS += --disable-sslv3
>  endif
>  
> -ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> -WOLFSSL_CONF_OPTS += --enable-armasm
> -else
> -WOLFSSL_CONF_OPTS += --disable-armasm
> -endif

So perhaps --disable-armasm should be passed unconditionally?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
