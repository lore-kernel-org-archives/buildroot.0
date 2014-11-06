From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 6 Nov 2014 13:51:20 +0200
Subject: [Buildroot] [PATCH] uclibc: respect top-level TARGET_CFLAGS
In-Reply-To: <1415274442-24547-1-git-send-email-abrodkin@synopsys.com>
References: <1415274442-24547-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141106115120.GG2234@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Thu, Nov 06, 2014 at 02:47:22PM +0300, Alexey Brodkin wrote:
> When BR2_TARGET_OPTIMIZATION is used (with some specific compiler flags)
> it's expected that ALL target binaries will be built with specified options.
> 
> Currently uClibc is built with its own set of options.
> This change allows passing additional flags to uclibc build system.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Have you actually CCed all these addresses? I only see Thomas in the Cc: 
header, besides you.

baruch

> ---
>  package/uclibc/uclibc.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index ce416dd..419a4d1 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -24,6 +24,8 @@ endif
>  
>  UCLIBC_INSTALL_STAGING = YES
>  
> +UCLIBC_EXTRA_CFLAGS = $(TARGET_CFLAGS)
> +
>  # uclibc is part of the toolchain so disable the toolchain dependency
>  UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
