From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2021 22:34:10 +0100
Subject: [Buildroot] [PATCH v3,
 5/6] package/ushare: add libupnp 1.14.x support
In-Reply-To: <20210125194949.1173139-5-fontaine.fabrice@gmail.com>
References: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
 <20210125194949.1173139-5-fontaine.fabrice@gmail.com>
Message-ID: <20210125213410.GR2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-25 20:49 +0100, Fabrice Fontaine spake thusly:
> This switch is needed to fix CallStranger a.k.a. CVE-2020-12695
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0004-switch-to-libupnp-1.14.x-API.patch   | 433 ++++++++++++++++++
>  1 file changed, 433 insertions(+)
>  create mode 100644 package/ushare/0004-switch-to-libupnp-1.14.x-API.patch
> 
> diff --git a/package/ushare/0004-switch-to-libupnp-1.14.x-API.patch b/package/ushare/0004-switch-to-libupnp-1.14.x-API.patch
> new file mode 100644
> index 0000000000..e200bb1926
> --- /dev/null
> +++ b/package/ushare/0004-switch-to-libupnp-1.14.x-API.patch
> @@ -0,0 +1,433 @@
> +From 4643b9cb9e6c0331fd663437a7ed8061b9edf971 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 24 Aug 2020 19:26:03 +0200
> +Subject: [PATCH] switch to libupnp 1.14.x API
> +
> +Use the new libupnp 1.14.x API (i.e. UpnpInit2) to allow ushare to be
> +protected against CallStranger a.k.a. CVE-2020-12695
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/ddugovic/uShare/commit/4643b9cb9e6c0331fd663437a7ed8061b9edf971]

Upstream seems pretty dead, and they even acknowledge that status:

    https://ushare.geexbox.org/

    By lack of spare time, motivation and interest, uShare development
    is currently discontinued (this may change though). Don't expect
    release anytime soon :-(

So, what about switching over to the fork on https://github.com/ddugovic/uShare
which at least seems to like the patches you submit them? ;-)

Anyway: applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
