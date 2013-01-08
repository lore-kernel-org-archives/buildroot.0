From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Jan 2013 00:08:03 +0100
Subject: [Buildroot] [PATCH 07/28] xserver_xorg-server: add more
 explanations about the two variants
In-Reply-To: <4383e0addeae7263c37e627d0df1e42ea73f13d1.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <4383e0addeae7263c37e627d0df1e42ea73f13d1.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50ECA6D3.40905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/06/13 22:29, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)

> ---
>   package/x11r7/xserver_xorg-server/Config.in |   10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> index 2382786..6c70196 100644
> --- a/package/x11r7/xserver_xorg-server/Config.in
> +++ b/package/x11r7/xserver_xorg-server/Config.in
> @@ -68,12 +68,22 @@ choice
>   config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
>   	bool "Modular X.org"
>   	depends on BR2_LARGEFILE&&  BR2_INSTALL_LIBSTDCPP
> +	help
> +	  This variant of the X.org server is the full-blown variant,
> +	  as used by desktop GNU/Linux distributions. The drivers (for
> +	  input and graphics) are built separately from the X.org
> +	  server (see the xdriver* packages).

  Come to think of it, it would be more logical to move these packages 
directly below the xorg-server config option.


>   comment "X.org requires largefile and C++ support"
              ^
              Modular X.org
  would also be an improvement.

>   	depends on !(BR2_LARGEFILE&&  BR2_INSTALL_LIBSTDCPP)
>
>   config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
>   	bool "KDrive / TinyX"
> +	help
> +	  This variant of the X.org server is a lightweight version
> +	  intended for embedded systems. The drivers (for input and
> +	  graphics) are built into the server. It is generally used
> +	  directly on top of the Linux framebuffer.

  without DRM or video card specific drivers.

  Right?

  Regards,
  Arnout

>
>   endchoice
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
