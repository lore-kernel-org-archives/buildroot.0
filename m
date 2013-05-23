From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 May 2013 08:50:51 +0200
Subject: [Buildroot] [PATCH] package/dvb-apps: utils requires a
 toolchain with threads
In-Reply-To: <1369116873-26930-1-git-send-email-yann.morin.1998@free.fr>
References: <1369116873-26930-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130523065051.GA3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2013-05-21 08:14 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Fixes:
>     http://autobuild.buildroot.net/results/b62/b62289809221b6455fe3db501e869271a64ea454/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/dvb-apps/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
> index 7f76330..815381a 100644
> --- a/package/dvb-apps/Config.in
> +++ b/package/dvb-apps/Config.in
> @@ -8,12 +8,13 @@ config BR2_PACKAGE_DVB_APPS
>  
>  if BR2_PACKAGE_DVB_APPS
>  
> -comment "dvb-apps utils needs LARGEFILE support in the toolchain"
> -	depends on !BR2_LARGEFILE
> +comment "dvb-apps utils needs LARGEFILE and THREADS support in the toolchain"
> +	depends on ! BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS

Doh... I forgot parenthesis...

Fortunately, Gilles as sent a correct version, which I'll Ack soon.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
