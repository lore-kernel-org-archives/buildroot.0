From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 16:39:00 +0100
Subject: [Buildroot] [PATCH 1/1] support/dependencies: set cmake version
 min to 3.15.3
In-Reply-To: <20200428054352.110007-1-james.hilliard1@gmail.com>
References: <20200428054352.110007-1-james.hilliard1@gmail.com>
Message-ID: <20201225153900.GA1640183@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

Sorry to come back to that one so late...

On 2020-04-27 23:43 -0600, James Hilliard spake thusly:
> This is required by uvw.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ab6/ab6954a65fd6d43c0674cb7a38a941102cb0dfe3/build-end.log
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Following the discussion on this thread back at the time, it turned out
that the real minimum version was in fact 3.13, not 3.15, and it still
is, but I can't see a v2 of that patch changing to just 3.13.

Furthermore, I've now applied another, nore recent, patch by Fabrice,
who provided a better commit log at explaining another good reason to
bump to 3.15.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  support/dependencies/check-host-cmake.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index 01f38da376..b0a704c0f2 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -3,7 +3,7 @@
>  # package is bumped or a new one added, and it requires a higher
>  # version, our cmake infra will catch it and build its own.
>  #
> -BR2_CMAKE_VERSION_MIN = 3.10
> +BR2_CMAKE_VERSION_MIN = 3.15.3
>  
>  BR2_CMAKE_CANDIDATES ?= cmake cmake3
>  BR2_CMAKE ?= $(call suitable-host-package,cmake,\
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
