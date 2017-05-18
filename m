From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 18 May 2017 06:23:06 +0300
Subject: [Buildroot] [PATCH 1/1] package/avrdude: fix gpio definition,
 add kconfig option
In-Reply-To: <1495061934-57465-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1495061934-57465-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170518032306.mbvzslnrmtrh45it@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt, Sam,

On Wed, May 17, 2017 at 05:58:54PM -0500, Matt Weber wrote:
> +if BR2_PACKAGE_AVRDUDE
> +
> +config BR2_PACKAGE_AVRDUDE_LINUXGPIO
> +	bool "linux gpio"
> +	depends on BR2_PACKAGE_AVRDUDE
> +	help
> +	  Enables the tool to use the Linux Sysfs based GPIO framework for GPIO 
> +	  access by configuring AVRDude with '--enable-linuxgpio'. 
> +endif

How big is the size impact of enabling this option? If it is relatively small, 
enabling gpio support unconditionally would be better, I think.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
