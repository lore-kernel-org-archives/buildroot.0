From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 10 Nov 2016 12:54:47 -0200
Subject: [Buildroot] [PATCH next 1/2] olimex_imx233_olinuxino: bump
	version
In-Reply-To: <1478560176-29807-1-git-send-email-francois.perrad@gadz.org>
References: <1478560176-29807-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAOMZO5ATK4Fo8iQ1v3TBZ0MdXQ7rw2eNGGnQ6uP_knfuZHmBSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Mon, Nov 7, 2016 at 9:09 PM, Francois Perrad <fperrad@gmail.com> wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../imx233_olinuxino/genimage-imx233_olinuxino.cfg |   1 +
>  board/olimex/imx233_olinuxino/linux-3.18.config    | 152 ---------------------
>  board/olimex/imx233_olinuxino/post-image.sh        |   3 -
>  configs/olimex_imx233_olinuxino_defconfig          |  16 ++-
>  4 files changed, 10 insertions(+), 162 deletions(-)

Thanks for this patch!

> diff --git a/board/olimex/imx233_olinuxino/linux-3.18.config b/board/olimex/imx233_olinuxino/linux-3.18.config
> deleted file mode 100644
> index d46d4d5..0000000
> --- a/board/olimex/imx233_olinuxino/linux-3.18.config
> +++ /dev/null

> -CONFIG_NET=y
> -CONFIG_PACKET=y
> -CONFIG_UNIX=y
> -CONFIG_INET=y
> -CONFIG_IP_PNP=y
> -CONFIG_IP_PNP_DHCP=y
> -CONFIG_SYN_COOKIES=y
> -CONFIG_CFG80211=y
> -CONFIG_CFG80211_WEXT=y

> -CONFIG_USB_USBNET=y
> -CONFIG_USB_NET_SMSC95XX=y
> -CONFIG_RTL8187=m
> -CONFIG_ATH_CARDS=m
> -CONFIG_ATH9K_HTC=m
> -CONFIG_RT2X00=m
> -CONFIG_RT73USB=m
> -CONFIG_RT2800USB=m
> -CONFIG_RT2800USB_RT53XX=y
> -CONFIG_RT2800USB_RT55XX=y
> -CONFIG_RT2800USB_UNKNOWN=y
> -CONFIG_RTL_CARDS=m
> -CONFIG_RTL8192CU=m

After the removal of this defconfig, wifi is no longer functional by default.

It would be good to submit a follow up patch that adds a linux
fragment file that enables the Wifi related options.

Thanks,

Fabio Estevam
