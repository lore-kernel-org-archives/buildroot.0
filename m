From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 Sep 2015 21:15:41 +0300
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: bump to version
 2.4
In-Reply-To: <1441639190-7447-1-git-send-email-joerg.krause@embedded.rocks>
References: <1441639190-7447-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150907181541.GJ2213@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Mon, Sep 07, 2015 at 05:19:50PM +0200, J?rg Krause wrote:
> Version 2.4 of shairport-sync introduces new optional features (metadata,
> stdout, pipe) which we enable by default. The impact on the binary size is
> about 18 kB (110 kB vs 92 kB) for an ARM target.
> 
> Also add a new dependency to libconfig and install the default config script.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/shairport-sync/Config.in         | 1 +
>  package/shairport-sync/shairport-sync.mk | 9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
> index c1d81a7..c558a64 100644
> --- a/package/shairport-sync/Config.in
> +++ b/package/shairport-sync/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_PACKAGE_ALSA_LIB
>  	select BR2_PACKAGE_ALSA_LIB_MIXER
> +	select BR2_PACKAGE_LIBCONFIG

Isn't that a build time dependency? If so, please add to 
SHAIRPORT_SYNC_DEPENDENCIES as well.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
