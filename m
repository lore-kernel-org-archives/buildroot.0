From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 22:44:06 +0100
Subject: [Buildroot] [PATCH v3 14/17] package/pulseaudio: use the new
 fftw-single package
In-Reply-To: <20181231133030.25991-15-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-15-thomas.petazzoni@bootlin.com>
Message-ID: <20190101214406.GD23435@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gwenha?l, All,

On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

I think I may end up being seen as an old dotard, re-hashing the same
nonsense endlessly again and again, but...

Why did we switch to fftw-single only, when previously fftw was checked
for, which meant any variant of it?

Regards,
Yann E. MORIN.

>  	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
>  
>  ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
