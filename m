From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:18:38 +0100
Subject: [Buildroot] [PATCHv3 51/74] xenomai: add error handling to for
 loop
In-Reply-To: <1417357142-14307-52-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-52-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130171838.GE4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xenomai/xenomai.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> index 740a40b..ccbae35 100644
> --- a/package/xenomai/xenomai.mk
> +++ b/package/xenomai/xenomai.mk
> @@ -99,7 +99,7 @@ XENOMAI_DEPENDENCIES += udev
>  define XENOMAI_INSTALL_UDEV_RULES
>  	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
>  		for f in $(@D)/ksrc/nucleus/udev/*.rules ; do \
> -			cp $$f $(TARGET_DIR)/etc/udev/rules.d/ ; \
> +			cp $$f $(TARGET_DIR)/etc/udev/rules.d/ || exit 1 ; \
>  		done ; \
>  	fi;
>  endef
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
