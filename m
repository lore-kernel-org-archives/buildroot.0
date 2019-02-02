From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Feb 2019 17:45:04 +0100
Subject: [Buildroot] [PATCH v4 14/17] package/pulseaudio: use the new
 fftw-single package
In-Reply-To: <1548078671-63318-14-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-5-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-6-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-7-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-8-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-10-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-11-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-12-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-13-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-14-git-send-email-gwenj@trabucayre.com>
Message-ID: <20190202164504.GF6663@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2019-01-21 14:51 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> This patch add an explicitly dependency to fftw-single (the only compatible
> fftw's flavor) instead of default behavior where the package do assumption
> about the compatible version.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v3 -> v4:
>  * improve commit message about fftw version. (Yann)
> ---
>  package/pulseaudio/pulseaudio.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index d1c35654cf..c91af22935 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -21,7 +21,7 @@ PULSEAUDIO_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
>  	$(if $(BR2_PACKAGE_DBUS),dbus) \
>  	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
> -	$(if $(BR2_PACKAGE_FFTW),fftw) \
> +	$(if $(BR2_PACKAGE_FFTW_SINGLE),fftw-single) \
>  	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
>  
>  ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
> -- 
> 2.19.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
