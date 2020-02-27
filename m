From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 18:27:27 +0100
Subject: [Buildroot] [PATCH 3/4] package/openrc: adapt "modules" init
 script to busybox "modprobe"
In-Reply-To: <20200227123938.13412-4-unixmania@gmail.com>
References: <20200227123938.13412-1-unixmania@gmail.com>
 <20200227123938.13412-4-unixmania@gmail.com>
Message-ID: <20200227182727.0b277df7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 09:39:37 -0300
unixmania at gmail.com wrote:

> +# modprobe can be provided by either kmod or busybox
> +ifeq ($(BR2_PACKAGE_KMOD_TOOLS),)
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> +# Busybox modprobe does not have a --first-time option; --verbose is just -v
> +# and --use-blacklist is just -b.
> +ifeq ($(call KCONFIG_GET_OPT,CONFIG_MODPROBE,$(BUSYBOX_BUILD_CONFIG)),y)

Is this working? Isn't that evaluated when Makefiles are parsed, i.e
before the build has extracted Busybox and created its .config file ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
