From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:28:59 +0200
Subject: [Buildroot] [PATCH 2/8 v11] package/xserver_xorg-server: make
 the version a choice
In-Reply-To: <9c8b07c5f9dfa43280456e5e1ec375042f8e09c9.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
 <9c8b07c5f9dfa43280456e5e1ec375042f8e09c9.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <20150426222859.5245ada8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 21 Apr 2015 19:04:38 +0200, Yann E. MORIN wrote:
> Only a single entry for now, but we'll add one more in an upcoming
> patch, to support old binary-only drivers, like the NVidia Tegra2/3
> drivers.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/x11r7/xserver_xorg-server/Config.in              | 12 ++++++++++++
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
> index 1123f3b..3a7b18b 100644
> --- a/package/x11r7/xserver_xorg-server/Config.in
> +++ b/package/x11r7/xserver_xorg-server/Config.in
> @@ -57,6 +57,18 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
>  if BR2_PACKAGE_XSERVER_XORG_SERVER
>  
>  choice
> +	bool "X Window System server version"
> +
> +config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17_1

I think it is not very useful to encode the minor version in the
Config.in option name, so I've renamed that to
BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17 and applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
