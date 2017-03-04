From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 23:42:01 +0100
Subject: [Buildroot] [PATCH v1] gst1-plugins-bad: waylandsink needs
 wayland-protocols
In-Reply-To: <20170304213125.13321-1-ps.report@gmx.net>
References: <20170304213125.13321-1-ps.report@gmx.net>
Message-ID: <20170304234201.34e48ed4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Mar 2017 22:31:25 +0100, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in           | 5 +++--
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 6bec362db..923ed2cfc 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -112,11 +112,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
>  	default y
>  	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
>  	depends on BR2_PACKAGE_WAYLAND
> +	depends on BR2_PACKAGE_WAYLAND_PROTOCOLS

Did you try if a "select BR2_PACKAGE_WAYLAND_PROTOCOLS" works here?
That would be a bit nicer IMO.

Double check the output of "make menuconfig", to make sure this doesn't
cause any recursive dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
