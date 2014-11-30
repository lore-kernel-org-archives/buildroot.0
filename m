From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:12:15 +0100
Subject: [Buildroot] [PATCHv3 40/74] ebtables: add error handling to for
 loop
In-Reply-To: <1417357142-14307-41-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-41-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130171215.GT4124@free.fr>
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
>  package/ebtables/ebtables.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
> index 578c3ae..23c4628 100644
> --- a/package/ebtables/ebtables.mk
> +++ b/package/ebtables/ebtables.mk
> @@ -28,7 +28,7 @@ define EBTABLES_INSTALL_TARGET_CMDS
>  		$(@D)/$(EBTABLES_SUBDIR)/extensions/*.so; \
>  		do \
>  		$(INSTALL) -m 0755 -D $${so} \
> -			$(TARGET_DIR)/lib/ebtables/`basename $${so}`; \
> +			$(TARGET_DIR)/lib/ebtables/`basename $${so}` || exit 1; \
>  	done
>  	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
>  		$(TARGET_DIR)/sbin/ebtables
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
