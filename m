From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 15 Dec 2015 08:37:52 +0200
Subject: [Buildroot] [PATCH] linux: Build and install kernel selftests
In-Reply-To: <20151214221846.GD4152@free.fr>
References: <1448409222-4510-1-git-send-email-cyrilbur@gmail.com>
 <1448409222-4510-2-git-send-email-cyrilbur@gmail.com>
 <20151214221846.GD4152@free.fr>
Message-ID: <20151215063752.GK2318@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Dec 14, 2015 at 11:18:46PM +0100, Yann E. MORIN wrote:
> On 2015-11-25 10:53 +1100, Cyril Bur spake thusly:
> > +config BR2_LINUX_KERNEL_TOOL_SELFTESTS
> > +	bool "selftests"
> 
> Since the .mk has:
>     SELFTESTS_DEPENDENCIES = bash
> 
> then you must either depend on bash or select it here. I think a select
> is better, so:
> 
>     depends on BR2_USE_MMU  # bash
>     select BR2_PACKAGE_BASH

But BR2_PACKAGE_BASH depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS. Should 
BR2_LINUX_KERNEL_TOOL_SELFTESTS also depend on 
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
