From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 15:25:36 +0100
Subject: [Buildroot] [PATCH next v6 10/10] package/pkg-kconfig: handle
 KCONFIG_DEPENDENCIES with per-package directories
In-Reply-To: <a8dd7196-7542-24ee-7ca2-44318d33d626@andin.de>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-11-thomas.petazzoni@bootlin.com>
 <64e9a50c-97d4-c90a-fac5-eae91cb8ae8e@andin.de>
 <a8dd7196-7542-24ee-7ca2-44318d33d626@andin.de>
Message-ID: <20181206152536.1112255b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Dec 2018 15:07:53 +0100, Andreas Naumann wrote:

> >> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> >> index d6c95b897e..bf43632adc 100644
> >> --- a/package/pkg-kconfig.mk
> >> +++ b/package/pkg-kconfig.mk
> >> @@ -113,6 +113,7 @@ endef
> >> ? # Since the file could be a defconfig file it needs to be expanded to a
> >> ? # full .config first.
> >> ? $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) 
> >> $$($(2)_KCONFIG_FRAGMENT_FILES)
> >> +??? $$(call prepare-per-package-folder,$$($(2)_KCONFIG_DEPENDENCIES))  
> 
> just realized that this doesn't match the function definition in 
> pkg-utils.mk in this series (prepare-per-package-directories), thus is 
> not executed at all. With that fixed ccache is, as part of toolchain, 
> properly prepared and I no longer see the issue below.

Gaah, indeed. Well-spotted. Will fix. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
