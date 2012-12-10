From: Diego Iastrubni <diegoiast@gmail.com>
Date: Mon, 10 Dec 2012 14:15:35 +0200
Subject: [Buildroot] [git commit] ccache: uses fork(),
 therefore only usable on MMU platforms
In-Reply-To: <20121209210012.5D1F49A157@busybox.osuosl.org>
References: <20121209210012.5D1F49A157@busybox.osuosl.org>
Message-ID: <CALR4fEJsZQVHB_-KrvoVRmYN-s-sTemXFMB9FX_VAyTu7yiyVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 9, 2012 at 10:49 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>
> diff --git a/package/ccache/Config.in b/package/ccache/Config.in
> index 4a37973..30e6578 100644
> --- a/package/ccache/Config.in
> +++ b/package/ccache/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_CCACHE
>         bool "ccache"
> +       # needs fork()
> +       depends on BR2_USE_MMU
>         help

Wait, what?

What if I am corss compiling from i386 to blackfin? ccache can work on
i386... the only problem is for target packages, not host packages.

(unless you are using buildroot *on* blackfin or similar devices...
