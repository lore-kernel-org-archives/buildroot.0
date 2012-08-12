From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Aug 2012 17:17:26 +0300
Subject: [Buildroot] [PATCH] PAM support in Busybox if linux-pam is built
In-Reply-To: <1344740623-29446-1-git-send-email-golubovsky@gmail.com>
References: <1344740623-29446-1-git-send-email-golubovsky@gmail.com>
Message-ID: <20120812141726.GP21035@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dmitry,

On Sat, Aug 11, 2012 at 11:03:43PM -0400, Dmitry wrote:

[snip]

> +config BR2_PACKAGE_BUSYBOX_PAM
> +	bool "Enable PAM support in Busybox"
> +	default y
> +	depends on BR2_PACKAGE_LINUX_PAM
> +	help
> +	  PAM support in Busybox is enabled by default if package 
> +	  linux-pam is selected. Make sure that files /etc/pam.d/default
> +	  and/or /etc/pam.d/login exist and contain valid authentication
> +	  stack. Otherwise you will not be able to log into the booted
> +	  system. If unsure unselect this item.

The last help sentence seems to contradict the 'default y' enable by default 
above.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
