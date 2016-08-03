From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Aug 2016 14:29:25 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: hls: allow user to
 select crypto backend
In-Reply-To: <1470226767-21018-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470226767-21018-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160803142925.3af9c6b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Aug 2016 17:49:27 +0530, Rahul Bedarkar wrote:

> +if BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
> +
> +choice
> +	prompt "choose HLS cryptographic backend"
> +	default BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_NETTLE
> +
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_LIBGCRYPT
> +	bool "libgcrypt"
> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
> +	select BR2_PACKAGE_LIBGCRYPT
> +
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_NETTLE
> +	bool "nettle"
> +	select BR2_PACKAGE_NETTLE
> +
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_OPENSSL
> +	bool "openssl"
> +	select BR2_PACKAGE_OPENSSL
> +
> +endchoice

I'm not sure I want to see a choice for this. Could we instead have
the .mk file automatically selected the backend according to which
crypto package(s) are available?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
