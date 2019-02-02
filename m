From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Feb 2019 17:41:55 +0100
Subject: [Buildroot] [PATCH v4 11/17] package/httping: use the new
 fftw-double package
In-Reply-To: <1548078671-63318-11-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-2-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-3-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-5-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-6-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-7-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-8-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-10-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-11-git-send-email-gwenj@trabucayre.com>
Message-ID: <20190202164155.GC6663@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2019-01-21 14:51 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> This patch add an explicitly dependency to fftw-double (the only compatible
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
>  package/httping/httping.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/httping/httping.mk b/package/httping/httping.mk
> index 955ee3131b..b3a625a8e1 100644
> --- a/package/httping/httping.mk
> +++ b/package/httping/httping.mk
> @@ -17,9 +17,9 @@ HTTPING_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>  	$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncurses) \
>  	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
> -	$(if $(BR2_PACKAGE_FFTW),fftw)
> +	$(if $(BR2_PACKAGE_FFTW_DOUBLE),fftw-double)
>  HTTPING_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
> -	FW=$(if $(BR2_PACKAGE_FFTW),yes,no) \
> +	FW=$(if $(BR2_PACKAGE_FFTW_DOUBLE),yes,no) \
>  	NC=$(if $(BR2_PACKAGE_NCURSES_WCHAR),yes,no) \
>  	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
>  	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
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
