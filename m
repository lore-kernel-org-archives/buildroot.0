From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:29:37 +0100
Subject: [Buildroot] [PATCHv3 18/74] mongoose: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-19-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-19-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130152937.GW4124@free.fr>
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
>  package/mongoose/mongoose.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
> index 35e4b43..7a5d356 100644
> --- a/package/mongoose/mongoose.mk
> +++ b/package/mongoose/mongoose.mk
> @@ -29,6 +29,9 @@ endef
>  define MONGOOSE_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 755 $(@D)/examples/web_server/web_server \
>  		$(TARGET_DIR)/usr/sbin/mongoose
> +endef
> +
> +define MONGOOSE_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 755 package/mongoose/S85mongoose \
>  		$(TARGET_DIR)/etc/init.d/S85mongoose
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
