From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 15 Sep 2020 22:51:59 +0200
Subject: [Buildroot] [PATCH v2] package/sentry-native: new package
In-Reply-To: <20200915193705.3191857-1-joseph.kogut@gmail.com>
References: <20200908222431.1047587-1-joseph.kogut@gmail.com>
 <20200915193705.3191857-1-joseph.kogut@gmail.com>
Message-ID: <9c2c3a42-5b86-9579-be1d-bd31e61a6e7a@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph and all,

On 15/09/20 21:37, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> 
> ---
> Changes v1 -> v2:
> 	- Install libsentry to target
> 
>   DEVELOPERS                                    |  1 +
>   package/Config.in                             |  1 +
>   .../0001-sentry.h-include-ucontext.h.patch    | 27 +++++++++++++++++++
>   package/sentry-native/Config.in               | 25 +++++++++++++++++
>   package/sentry-native/sentry-native.hash      |  3 +++
>   package/sentry-native/sentry-native.mk        | 22 +++++++++++++++
>   6 files changed, 79 insertions(+)
>   create mode 100644 package/sentry-native/0001-sentry.h-include-ucontext.h.patch
>   create mode 100644 package/sentry-native/Config.in
>   create mode 100644 package/sentry-native/sentry-native.hash
>   create mode 100644 package/sentry-native/sentry-native.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d59d538e42..931f3a35f2 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1422,6 +1422,7 @@ F:	package/python-schedule/
>   F:	package/python-sentry-sdk/
>   F:	package/python-websockets/
>   F:	package/python-xlib/
> +F:	package/sentry-native/
>   F:	package/unclutter-xfixes/
> 
>   N:	Joshua Henderson <joshua.henderson@microchip.com>
> diff --git a/package/Config.in b/package/Config.in
> index 1cf36fa28a..3672ad1f06 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -130,6 +130,7 @@ menu "Debugging, profiling and benchmark"
>   	source "package/ramspeed/Config.in"
>   	source "package/rt-tests/Config.in"
>   	source "package/spidev_test/Config.in"
> +	source "package/sentry-native/Config.in"

You should place this one line above to maintain the alphabetic order.
Besides this cosmetic comment,

Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>

Cheers,
Titouan
