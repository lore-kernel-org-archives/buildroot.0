From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 13 May 2018 20:59:45 +0200
Subject: [Buildroot] [PATCH] libkrb5: disable rpath
In-Reply-To: <2d3716532e37e7fd57c930fcca6e4656ec7fa649.1526236679.git.baruch@tkos.co.il>
References: <2d3716532e37e7fd57c930fcca6e4656ec7fa649.1526236679.git.baruch@tkos.co.il>
Message-ID: <88c0c62f-cb6c-4dcc-2b0c-b5b450b21142@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 13.05.2018 um 20:37 schrieb Baruch Siach:
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
> 

Thank you!
Sorry for not catching those myself, I just had no clue what was going on here and with the other failures.

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
