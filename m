From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Oct 2019 23:01:51 +0200
Subject: [Buildroot] [PATCH v2] package/x11r7/xserver_xorg-server: fix
 mesa3d glx support
In-Reply-To: <20191012204341.29471-1-unixmania@gmail.com>
References: <20191012204341.29471-1-unixmania@gmail.com>
Message-ID: <2b4f366f-b35c-46f5-a618-a2f6419af689@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/10/2019 22:43, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Commit 5cb821d5635 added a new option to enable GLX support in mesa3d.
> Adjust xserver_xorg-server to use it.

 Applied to master, thanks. I extended the commit message a little bit to
explain why it was depending on DRI before.

 Regards,
 Arnout

> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index a33cb25076..c15047cbe4 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -120,7 +120,7 @@ else # modular
>  XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
>  endif
>  
> -ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
> +ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)),y)
>  XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
>  XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
>  else
> 
