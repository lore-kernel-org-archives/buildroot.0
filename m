From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 Mar 2015 13:02:40 +0200
Subject: [Buildroot] [PATCH v2] package/perf: build outside kernel tree
In-Reply-To: <1426762651-7734-1-git-send-email-steven@uplinklabs.net>
References: <1426762651-7734-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20150319110240.GE2415@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steven,

On Thu, Mar 19, 2015 at 03:57:31AM -0700, Steven Noonan wrote:
>  # Source taken from the Linux kernel tree
> -PERF_SOURCE =
>  PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
> +PERF_SOURCE = linux-$(PERF_VERSION).tar.xz
> +ifeq ($(findstring x2.6.,x$(PERF_VERSION)),x2.6.)
> +PERF_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
> +else
> +PERF_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x

What about v4.x?

> +endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
