From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 14:24:58 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/iperf3: fix openssl
 detection
In-Reply-To: <20180811185519.29273-1-bernd.kuhls@t-online.de>
References: <20180811185519.29273-1-bernd.kuhls@t-online.de>
Message-ID: <20180812142458.43fb1a5f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Aug 2018 20:55:19 +0200, Bernd Kuhls wrote:

> diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
> index 0080bd8c6c..e033af13e1 100644
> --- a/package/iperf3/iperf3.mk
> +++ b/package/iperf3/iperf3.mk
> @@ -13,8 +13,7 @@ IPERF3_LICENSE_FILES = LICENSE
>  IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -IPERF3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
> -IPERF3_DEPENDENCIES += openssl
> +IPERF3_DEPENDENCIES += host-pkgconf openssl

I've added a comment in the code to explain why we don't pass
--with-openssl, as we could mistakenly re-add it later on otherwise.

Applied to next with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
