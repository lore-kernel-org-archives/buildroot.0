From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 21 Mar 2017 09:31:24 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/cwiid: add optional
 dependency to bluez5_utils
In-Reply-To: <20170321072207.5396-1-bernd.kuhls@t-online.de>
References: <20170321072207.5396-1-bernd.kuhls@t-online.de>
Message-ID: <20170321073124.5qynrhrg4cp5gndm@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Tue, Mar 21, 2017 at 08:22:07AM +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: fix circular dependency (Arnout)
> 
>  package/cwiid/Config.in | 2 +-
>  package/cwiid/cwiid.mk  | 8 +++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
> index 03b7dbbcd..ed56e1084 100644
> --- a/package/cwiid/Config.in
> +++ b/package/cwiid/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_CWIID
>  	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus, alsa-lib, libglib2
>  	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
> -	select BR2_PACKAGE_BLUEZ_UTILS
> +	select BR2_PACKAGE_BLUEZ5_UTILS if !BR2_PACKAGE_BLUEZ_UTILS

You need to add missing bluez5_utils dependencies 
(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4, BR2_TOOLCHAIN_HAS_SYNC_4). Changing 
bluez_utils to bluez5_utils in the comments above would also be nice.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
