From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Apr 2017 11:43:51 +0300
Subject: [Buildroot] [PATCH] x11vnc: make x11vnc select libvncserver
In-Reply-To: <20170430083532.12941-1-martink@posteo.de>
References: <20170430083532.12941-1-martink@posteo.de>
Message-ID: <20170430084350.zpxjcn7y6ws4w4lf@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

On Sun, Apr 30, 2017 at 10:35:32AM +0200, Martin Kepplinger wrote:
> x11vnc needs libvncserver, so select it explicitely.
> 
> In case of missing libvncserver, we see build failures like this:
> 
> http://autobuild.buildroot.net/results/34f/34f8045e772b96293cc7d25bd61ac0aa5842824f/
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---
>  package/x11vnc/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
> index 0909b9aec..4542c5080 100644
> --- a/package/x11vnc/Config.in
> +++ b/package/x11vnc/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_X11VNC
>  	select BR2_PACKAGE_XLIB_LIBXT
>  	select BR2_PACKAGE_XLIB_LIBXEXT
>  	select BR2_PACKAGE_XLIB_LIBXTST
> +	select BR2_PACKAGE_LIBVNCSERVER

Since this is a build time dependency, you need to add it to 
X11VNC_DEPENDENCIES to make sure libvncserver builds before x11vnc.

You also need to propagate the additional BR2_PACKAGE_LIBVNCSERVER dependency, 
!BR2_nios2.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
