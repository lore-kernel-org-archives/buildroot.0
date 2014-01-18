From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 21:00:31 +0100
Subject: [Buildroot] [PATCH 09/10] urg: make sdl support optional
In-Reply-To: <1390073027-14239-10-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-10-git-send-email-s.martin49@gmail.com>
Message-ID: <20140118200031.GE23411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-01-18 20:23 +0100, Samuel Martin spake thusly:
> Only enable SDL support if SDL and SDL_net are already enabled in the
> configuration.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I have a comment, see below...

> ---
>  package/urg/Config.in |  5 ++---
>  package/urg/urg.mk    | 10 +++++++---
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/package/urg/Config.in b/package/urg/Config.in
> index ded8204..232f4c4 100644
> --- a/package/urg/Config.in
> +++ b/package/urg/Config.in
> @@ -1,11 +1,10 @@
>  config BR2_PACKAGE_URG
>  	bool "urg"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	select BR2_PACKAGE_SDL
> -	select BR2_PACKAGE_SDL_NET
>  	help
>  	  Library to control Hokuyo's URG series sensors.
> -	  Requires SDL & SDL_net.
> +
> +	  If SDL and SDL_net are enable, SDL support will be automatically added.

I don't think we systematically add such info in the help entries.
I wonder if we should.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
