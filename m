From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 21:11:04 +0200
Subject: [Buildroot] [PATCH] libkrb5: disable rpath
In-Reply-To: <2d3716532e37e7fd57c930fcca6e4656ec7fa649.1526236679.git.baruch@tkos.co.il>
References: <2d3716532e37e7fd57c930fcca6e4656ec7fa649.1526236679.git.baruch@tkos.co.il>
Message-ID: <20180513191104.GC22130@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

Added Matthew in Cc, as the failures only occur on hios autobuilder, as
I could see...

Matthew, not sure you saw my request on IRC: were you able to test the
same fix I shared on IRC?

On 2018-05-13 21:37 +0300, Baruch Siach spake thusly:
> The default rpath value for krb5 is /usr/lib. On some hosts this might
> confuse the build time linker as it looks for target libraries in the
> host /usr/lib directory.
> 
> Should fix:
> http://autobuild.buildroot.net/results/6df/6df84ed325ddd92248741d2f4737423b1b999489/
> http://autobuild.buildroot.net/results/049/049f5147288b418402b6e5a4181eff4d426c8d7a/
> http://autobuild.buildroot.net/results/432/432d5d0295f77cd34b78e70e8b4b7d77ef19ae3c/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libkrb5/libkrb5.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> index c40be632786b..d9d7160ae8d5 100644
> --- a/package/libkrb5/libkrb5.mk
> +++ b/package/libkrb5/libkrb5.mk
> @@ -28,7 +28,8 @@ LIBKRB5_CONF_OPTS = \
>  	--without-system-et \
>  	--without-system-ss \
>  	--without-system-verto \
> -	--without-tcl
> +	--without-tcl \
> +	--disable-rpath
>  
>  ifeq ($(BR2_PACKAGE_OPENLDAP),y)
>  LIBKRB5_CONF_OPTS += --with-ldap
> -- 
> 2.17.0
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
