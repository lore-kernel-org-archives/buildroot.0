From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 11 Mar 2016 09:05:00 +0200
Subject: [Buildroot] [PATCH 1/1] putty: add new package
In-Reply-To: <1457678759-11688-1-git-send-email-post@lespocky.de>
References: <1457678759-11688-1-git-send-email-post@lespocky.de>
Message-ID: <20160311070500.GF2057@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

On Fri, Mar 11, 2016 at 07:45:59AM +0100, Alexander Dahl wrote:
> +config BR2_PACKAGE_PUTTY
> +	bool "putty"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR
> +	help
> +	  PuTTY is a free SSH and Telnet client
> +
> +	  http://www.chiark.greenend.org.uk/~sgtatham/putty/

It might be useful to note here that the putty program itself depends on gtk2. 
Without gtk2, only command line utilities (pscp, plink, etc.) are built.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
