From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Feb 2019 23:08:47 +0100
Subject: [Buildroot] [PATCH v4 16/17] package/fftw: remove as regular
 package
In-Reply-To: <1548078671-63318-16-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-7-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-8-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-9-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-10-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-11-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-12-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-13-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-14-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-15-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-16-git-send-email-gwenj@trabucayre.com>
Message-ID: <20190202220847.GI6663@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All

On 2019-01-21 14:51 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> fftw is no longer a package: only fftw-single, fftw-double,
> fftw-long-double and fftw-quad are. fftw.mk only contains some common
> definitions that are used by the different fftw variants.
> 
> The old BR2_PACKAGE_FFTW_PRECISION_* options, which are no longer used
> anywhere, are moved to Config.in.legacy.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[--SNIP--]
> diff --git a/package/fftw/Config.in b/package/fftw/Config.in
> index ed87de1a70..89d99c5f9d 100644
> --- a/package/fftw/Config.in
> +++ b/package/fftw/Config.in
> @@ -1,5 +1,8 @@
>  config BR2_PACKAGE_FFTW
>  	bool "fftw"
> +	select BR2_PACKAGE_FFTW_DOUBLE if !BR2_PACKAGE_FFTW_SINGLE \
> +		&& !BR2_PACKAGE_FFTW_LONG_DOUBLE && !BR2_PACKAGE_FFTW_QUAD
> +

Spurious empty line here.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
