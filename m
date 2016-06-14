From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jun 2016 22:38:29 +0200
Subject: [Buildroot] [PATCH 4/5] grub2: really disable liblzma
In-Reply-To: <1465917079-30473-4-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465917079-30473-4-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160614203829.GA32391@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

Replying to the correct version now. Next time, can you set the version
of the series when sending, please? See:
    https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog

On 2016-06-14 17:11 +0200, Gilles Chanteperdrix spake thusly:
> Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> ---
>  boot/grub2/grub2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index 88a46f4..112a401 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -62,7 +62,7 @@ GRUB2_CONF_OPTS = \
>  	--with-platform=$(GRUB2_PLATFORM) \
>  	--disable-grub-mkfont \
>  	--enable-efiemu=no \
> -	--enable-liblzma=no \
> +	ac_cv_lib_lzma_lzma_code=no \

It would have been nice to say that --enale-liblzma is not a supported
option to grub2's configure.

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	--enable-device-mapper=no \
>  	--enable-libzfs=no \
>  	--disable-werror
> -- 
> 2.8.2
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
