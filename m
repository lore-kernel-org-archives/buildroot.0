From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 17:06:57 +0100
Subject: [Buildroot] [PATCH] linux: indicate proper CPE prefix
In-Reply-To: <20210107211336.3030397-1-thomas.petazzoni@bootlin.com>
References: <20210107211336.3030397-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210109160657.GU1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-01-07 22:13 +0100, Thomas Petazzoni spake thusly:
> The CPE type of the Linux kernel is special, it should be "o", unlike
> all other packages that use "a". We therefore need to override
> <pkg>_CPE_ID_PREFIX, so that the CPE ID of the linux package matches
> with the CPE dictionary.
> 
> Reported-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  linux/linux.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 648f6ea2a5..50d2ae3ff8 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -14,6 +14,7 @@ LINUX_LICENSE_FILES = \
>  endif
>  LINUX_CPE_ID_VENDOR = $(LINUX_NAME)
>  LINUX_CPE_ID_NAME = $(LINUX_NAME)_kernel
> +LINUX_CPE_ID_PREFIX = cpe:2.3:o
>  
>  define LINUX_HELP_CMDS
>  	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
