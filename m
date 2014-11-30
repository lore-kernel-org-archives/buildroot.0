From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:45:05 +0100
Subject: [Buildroot] [PATCHv3 24/74] openvpn: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-25-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-25-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130154505.GC4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/openvpn/openvpn.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index e0dba35..68f7d97 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -50,6 +50,9 @@ endif
>  define OPENVPN_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
>  		$(TARGET_DIR)/usr/sbin/openvpn
> +endef
> +
> +define OPENVPN_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 755 -D package/openvpn/S60openvpn \

Suddenly, I realise that some packages use 755 while others use 0755.

I don't care which we use (even though I have a slight preference for
0755), but we should have some coherence across all packages.

Anyway, not directly related to your patch, so:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  		$(TARGET_DIR)/etc/init.d/S60openvpn
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
