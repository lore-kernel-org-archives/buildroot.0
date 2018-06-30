From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 18:44:43 +0200
Subject: [Buildroot] [PATCH 3/3] systemd: fix nogroup
In-Reply-To: <20180629222552.12808-4-jeremy.rosen@smile.fr>
References: <20180629222552.12808-1-jeremy.rosen@smile.fr>
 <20180629222552.12808-4-jeremy.rosen@smile.fr>
Message-ID: <20180630164443.GF2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-06-30 00:25 +0200, J?r?my Rosen spake thusly:
> The special 65534 group is named nogroup (not nobody) in buildroot
> tell systemd about that
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/systemd/systemd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 0d5e348594..10e11a9277 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -43,7 +43,8 @@ SYSTEMD_CONF_OPTS += \
>  	-Dkexec-path=/usr/sbin/kexec \
>  	-Dsulogin-path=/usr/sbin/sulogin \
>  	-Dmount-path=/usr/bin/mount \
> -	-Dumount-path=/usr/bin/umount
> +	-Dumount-path=/usr/bin/umount \
> +	-Dnobody-group=nogroup

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  # disable unsupported features for non-glibc toolchains
>  ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> -- 
> 2.18.0
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
