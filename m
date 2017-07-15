From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 21:44:47 +0200
Subject: [Buildroot] [PATCH 1/3] package/nodejs: use shared c-ares if
 available
In-Reply-To: <1500140309-26534-1-git-send-email-martin@barkynet.com>
References: <1500140309-26534-1-git-send-email-martin@barkynet.com>
Message-ID: <20170715214447.76763605@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Jul 2017 18:38:27 +0100, Martin Bark wrote:

> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 43c5ff3..a469153 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -34,6 +34,11 @@ else
>  NODEJS_CONF_OPTS += --with-intl=none
>  endif
>  
> +ifeq ($(BR2_PACKAGE_C_ARES),y)
> +NODEJS_DEPENDENCIES += c-ares
> +NODEJS_CONF_OPTS += --shared-cares
> +endif

So what happens if BR2_PACKAGE_C_ARES is disabled? It is not
needed/used by nodejs, or some internal/built-in version is used?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
