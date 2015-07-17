From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Jul 2015 09:14:23 +0300
Subject: [Buildroot] [PATCH v1] racehound: fix kernel module compile
In-Reply-To: <1437081852-30727-1-git-send-email-ps.report@gmx.net>
References: <1437081852-30727-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150717061422.GC3147@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Jul 16, 2015 at 11:24:12PM +0200, Peter Seiderer wrote:
> -comment "racehound needs an Linux kernel to be built"
> +comment "racehound needs an Linux kernel >= 3.14 to be built"
>  	depends on !BR2_LINUX_KERNEL
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
>  	depends on BR2_i386 || BR2_x86_64

Should be:

   depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
