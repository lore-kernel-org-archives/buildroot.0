From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 May 2013 08:51:46 +0200
Subject: [Buildroot] [PATCH 1/5] dvb-apps utilities: needs threads
In-Reply-To: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
References: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20130523065146.GB3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2013-05-22 17:24 -0700, Gilles Talis spake thusly:
> Fixes:
> http://autobuild.buildroot.org/results/b62/b62289809221b6455fe3db501e869271a64ea454
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/dvb-apps/Config.in |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
> index 7f76330..a77064e 100644
> --- a/package/dvb-apps/Config.in
> +++ b/package/dvb-apps/Config.in
> @@ -8,12 +8,13 @@ config BR2_PACKAGE_DVB_APPS
>  
>  if BR2_PACKAGE_DVB_APPS
>  
> -comment "dvb-apps utils needs LARGEFILE support in the toolchain"
> -	depends on !BR2_LARGEFILE
> +comment "dvb-apps utils needs a toolchain with LARGEFILE and THREADS support"
> +	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS

That's where I made a mistake in my patch... :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
