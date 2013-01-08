From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Jan 2013 00:21:17 +0100
Subject: [Buildroot] [PATCH 08/28] x11r7: do not globally select
	libraries
In-Reply-To: <d72dbd3289911f78a4e38a783cbddafd3cfd5fef.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <d72dbd3289911f78a4e38a783cbddafd3cfd5fef.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50ECA9ED.5070208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/06/13 22:29, Thomas Petazzoni wrote:
> It doesn't make sense for BR2_PACKAGE_XORG7 to globally select
> libraries such as libpng, zlib, expat or fontconfig. For example, if
> you do a build with just xlib_libX11, then libpng gets built as the
> last package, without anybody actually depending on it, even if it was
> selected by BR2_PACKAGE_XORG7.
>
> The individual x11r7 packages should select the libraries they need,
> and add them in their DEPENDENCIES variable.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

  Although this is of course a very good idea, it's also risky. Possibly 
there are some X packages that rely on this implicit select. But I guess 
the autobuilders will expose those.


  Regards,
  Arnout

> ---
>   package/x11r7/Config.in |    4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
> index 6940725..706574c 100644
> --- a/package/x11r7/Config.in
> +++ b/package/x11r7/Config.in
> @@ -1,9 +1,5 @@
>   menuconfig BR2_PACKAGE_XORG7
>   	bool "X.org X Window System"
> -	select BR2_PACKAGE_ZLIB
> -	select BR2_PACKAGE_LIBPNG
> -	select BR2_PACKAGE_EXPAT
> -	select BR2_PACKAGE_FONTCONFIG
>   	depends on BR2_USE_WCHAR
>   	help
>   	  Support for X11R7 libraries, servers, drivers, and/or


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
