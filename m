From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Nov 2017 08:47:57 +0100
Subject: [Buildroot] [PATCH 1/1] freerdp: fix wayland client dependency
 chain failure
In-Reply-To: <20171119214852.27459-1-Adamduskett@outlook.com>
References: <20171119214852.27459-1-Adamduskett@outlook.com>
Message-ID: <20171120084757.04cf0411@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann in Cc.

On Sun, 19 Nov 2017 16:48:52 -0500, Adam Duskett wrote:
> If the wayland client is selected, freerdp depends on libxkbcommon without
> depending on it in the mk file.
> 
> Fixes:
> http://autobuild.buildroot.net/results/dc3/dc3e11f7076a8355f3d2f9cb49c6325dcf7084bd
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/freerdp/freerdp.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 69a89a190c..29c35164c3 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -207,6 +207,10 @@ else
>  FREERDP_CONF_OPTS += -DWITH_WAYLAND=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_WL),y)
> +FREERDP_DEPENDENCIES += libxkbcommon
> +endif

https://git.buildroot.org/buildroot/commit/?id=c2824fba2f2f4df6c1e0273fa546a203d1e6d5ac
already makes libxkbcommon a dependency of freerdp when wayland is
enabled. Isn't this sufficient ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
