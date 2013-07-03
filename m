From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Jul 2013 23:04:56 +0200
Subject: [Buildroot] [PATCH] libiqrf: Bump to v0.1.2 + update build
 system.
In-Reply-To: <1372884680-14309-1-git-send-email-marek.belisko@open-nandra.com>
References: <1372884680-14309-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20130703210456.GE3268@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marek, All,

On 2013-07-03 22:51 +0200, Marek Belisko spake thusly:
> v0.1.2 update build system from autotools to cmake.

Is it mandatory to switch to cmake when upgrading?
If not, then please split this in two: one to upgrade, one to switch.

If possible, I'd prefer we stick to using autotools if it is still
supported (and maintained) by libiqrf. I'm wary of the fuss around
cmake (but agreed, that's a personal taste). Every now and then, I
pester at cmake usage, since I don't really want to pay the price for
Yet-Another-Build-System, and the very few packages that I need and
use cmake, do compile in an aggregated time much smaller than it takes
to build cmake itself.

So, my personal taste would be to favour autotools against cmake
where/if possible, please. ;-)

Note: of course, if autotools is no longer supported by libiqrf, then
the switch is mandatory, but if so, state it explicitly in the commit
message.

> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  package/libiqrf/libiqrf.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
> index f2d5b4c..df4bb42 100644
> --- a/package/libiqrf/libiqrf.mk
> +++ b/package/libiqrf/libiqrf.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -LIBIQRF_VERSION = v0.1.0
> +LIBIQRF_VERSION = v0.1.2
>  LIBIQRF_SITE = http://github.com/nandra/libiqrf/tarball/$(LIBIQRF_VERSION)
>  LIBIQRF_INSTALL_STAGING = YES
>  
>  LIBIQRF_DEPENDENCIES = libusb
>  
> -$(eval $(autotools-package))
> +$(eval $(cmake-package))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
