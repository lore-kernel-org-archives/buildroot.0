From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 23:42:37 +0200
Subject: [Buildroot] [PATCH 3/5] package/nginx: add thread pool support
In-Reply-To: <1462132345-28253-3-git-send-email-martin@barkynet.com>
References: <1462132345-28253-1-git-send-email-martin@barkynet.com>
 <1462132345-28253-3-git-send-email-martin@barkynet.com>
Message-ID: <20160501234237.2618d1a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 20:52:23 +0100, Martin Bark wrote:

>  NGINX_CONF_OPTS += \
> -	$(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio)
> +	$(if $(BR2_PACKAGE_NGINX_FILE_AIO),--with-file-aio) \
> +	$(if $(BR2_PACKAGE_NGINX_THREADS),--with-threads)

Just curious, any reason to not enable this as soon as
BR2_TOOLCHAIN_HAS_THREADS=y ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
