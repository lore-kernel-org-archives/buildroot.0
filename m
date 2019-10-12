From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Oct 2019 15:59:16 +0200
Subject: [Buildroot] [PATCH v3 2/2] support/dependencies: set cmake
 version min to 3.10
In-Reply-To: <20191012131304.13283-2-james.hilliard1@gmail.com>
References: <20191012131304.13283-1-james.hilliard1@gmail.com>
 <20191012131304.13283-2-james.hilliard1@gmail.com>
Message-ID: <20191012135916.GX10860@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2019-10-12 07:13 -0600, James Hilliard spake thusly:
> This is required by wpewebkit and webkitgtk.

Maybe, but as my pro alter-ego already pointed out [0], cmake 3.10 and
above require a C++ compiler, which supports the emplace_hint metchod,
which is not always availble on the distributions Buildroot is supposed
to support.

Which means that, by bumping the cmake requirement to 3.10, all cmake
packages will have to depend on BR2_HOST_GCC_AT_LEAST_4_8 (or 4.9 or
what?).

I am not saying we do not want this, but the bump should not be lightly
applied. It has consequences.

[0] http://lists.busybox.net/pipermail/buildroot/2019-October/261264.html

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  support/dependencies/check-host-cmake.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index 5604713de6..01f38da376 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -1,9 +1,9 @@
> -# Set this to either 3.8 or higher, depending on the highest minimum
> +# Set this to either 3.10 or higher, depending on the highest minimum
>  # version required by any of the packages bundled in Buildroot. If a
>  # package is bumped or a new one added, and it requires a higher
>  # version, our cmake infra will catch it and build its own.
>  #
> -BR2_CMAKE_VERSION_MIN = 3.8
> +BR2_CMAKE_VERSION_MIN = 3.10
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
