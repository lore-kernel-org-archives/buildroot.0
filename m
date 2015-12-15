From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 15 Dec 2015 09:05:11 +0200
Subject: [Buildroot] [PATCH v2] gnutls: fix --disable-crywrap
In-Reply-To: <1450129196-15461-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450129196-15461-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151215070511.GN2318@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Mon, Dec 14, 2015 at 06:39:56PM -0300, Gustavo Zacarias wrote:
> Add a patch to really enable the --disable-crywrap option in gnutls.
> Fixes:
> http://autobuild.buildroot.org/results/d86/d8604fe448bb11395e8443726d09b041eb34c6d5/
> 
> Status: sent upstream (mailing list).

This comment would be more helpful in the patch itself.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> v2: need gettextize
> 
>  ...onfigure-really-make-disable-crywrap-work.patch | 38 ++++++++++++++++++++++
>  package/gnutls/gnutls.mk                           |  3 ++
>  2 files changed, 41 insertions(+)
>  create mode 100644 package/gnutls/0001-configure-really-make-disable-crywrap-work.patch
> 
> diff --git a/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch b/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch
> new file mode 100644
> index 0000000..01ed6bf
> --- /dev/null
> +++ b/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch
> @@ -0,0 +1,38 @@
> +From 996b3741e8c7a5d19ae6c554e062f20c259f52d7 Mon Sep 17 00:00:00 2001
> +From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +Date: Mon, 14 Dec 2015 15:16:24 -0300
> +Subject: [PATCH] configure: really make --disable-crywrap work
> +
> +The crywrap variable is set regardless of the state of enable_crywrap,
> +hence --disable-crywrap never works.
> +Just put the tests for crywrap deps inside the enable_crywrap
> +conditional.

Also, a link to your gnutls submission 
(http://lists.gnutls.org/pipermail/gnutls-devel/2015-December/007818.html) 
would be helpful.

> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
