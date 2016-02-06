From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 6 Feb 2016 23:50:33 +0200
Subject: [Buildroot] [PATCH] linux: add conditional patch for
	timeconst.pl
In-Reply-To: <1454700784-32341-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1454700784-32341-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20160206215033.GA8084@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Fri, Feb 05, 2016 at 04:33:04PM -0300, gustavo.zacarias at free-electrons.com wrote:
> @@ -251,8 +261,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
>  	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
> -	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
> -		$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))

Is this change intended?

>  endef
>  
>  ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
