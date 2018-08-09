From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 09 Aug 2018 17:34:57 +0300
Subject: [Buildroot] [PATCH] package/sysdig: bump to version 0.22.1
In-Reply-To: <1533825067-28079-1-git-send-email-angelo@amarulasolutions.com>
References: <1533825067-28079-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87600jboby.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

Angelo Compagnucci writes:
> This patch bumps sysdig to version 0.22.1 and adds a new dependency on
> elfutils.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/sysdig/Config.in   | 1 +
>  package/sysdig/sysdig.hash | 2 +-
>  package/sysdig/sysdig.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index 6ccb706..b527b78 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -13,6 +13,7 @@ config BR2_PACKAGE_SYSDIG
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_JQ
>  	select BR2_PACKAGE_LIBB64
> +	select BR2_PACKAGE_ELFUTILS

So elfutils is a mandatory dependency now, right? If so, you need to
replicate the dependencies of elfutils here.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
