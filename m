From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jul 2018 18:57:37 +0300
Subject: [Buildroot] [PATCH v2 2/2] package/lvm2: bump version to
 2.02.180
In-Reply-To: <20180726131023.28695-2-m.niestroj@grinn-global.com>
References: <20180726131023.28695-1-m.niestroj@grinn-global.com>
 <20180726131023.28695-2-m.niestroj@grinn-global.com>
Message-ID: <87zhyec7m6.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcin,

Marcin Niestroj writes:
> lvm2 starting from version 2.02.178 depends on libaio library.
>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
> Changes v1 -> v2:
>  * Add libaio dependencies for all packages that select lvm2
>    (suggested by Baruch)
>  * Adjust lvm2 patch in 'PATCH 1/2' to new lvm2 version
>
>  package/cryptsetup/Config.in                  |  2 +
>  package/dmraid/Config.in                      |  2 +
>  package/docker-engine/Config.in               |  1 +
>  ...gure-Introduce-enable-symvers-option.patch | 55 ++++++++++---------
>  package/lvm2/Config.in                        |  3 +
>  package/lvm2/lvm2.hash                        |  4 +-
>  package/lvm2/lvm2.mk                          |  6 +-
>  package/udisks/Config.in                      |  3 +
>  8 files changed, 44 insertions(+), 32 deletions(-)
>
> diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
> index 7322a4baf6..e4500b1cf2 100644
> --- a/package/cryptsetup/Config.in
> +++ b/package/cryptsetup/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_CRYPTSETUP
>  	bool "cryptsetup"
> +	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # lvm2

New dependencies need to be added to all reverse dependencies, and their
reverse dependencies, recursively. So since luksmeta selects cryptsetup,
it also needs this dependency.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
