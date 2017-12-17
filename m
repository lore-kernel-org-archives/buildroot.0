From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Dec 2017 08:13:14 +0200
Subject: [Buildroot] [PATCH 3/3] package/shapelib: version bump,
 use the new autotools build config and add new dependency on proj
In-Reply-To: <1513468381-8875-3-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1513468381-8875-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1513468381-8875-3-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20171217061314.5zgocni3ehz2wvdf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoltan,

On Sun, Dec 17, 2017 at 12:53:01AM +0100, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/shapelib/Config.in     |  5 +++++
>  package/shapelib/shapelib.hash |  2 +-
>  package/shapelib/shapelib.mk   | 17 +++--------------
>  3 files changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/package/shapelib/Config.in b/package/shapelib/Config.in
> index aa2297b..97ca403 100644
> --- a/package/shapelib/Config.in
> +++ b/package/shapelib/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_SHAPELIB
>  	bool "shapelib"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_PROJ

You need to propagate here the threads dependency of proj.

baruch

>  	help
>  	  The Shapefile C Library provides the ability to write simple
>  	  C programs for reading, writing and updating (to a limited
> @@ -7,3 +9,6 @@ config BR2_PACKAGE_SHAPELIB
>  	  (.dbf).
>  
>  	  http://shapelib.maptools.org/

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
