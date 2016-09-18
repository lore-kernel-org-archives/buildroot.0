From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 20:05:45 +0200
Subject: [Buildroot] [PATCH 04/11] Add root filesystem overlay files and
 directories for Arietta G25
In-Reply-To: <1470827167-9426-6-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
 <1470827167-9426-6-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160918200545.5b5359d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 13:06:00 +0200, Biagio Montaruli wrote:
> Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
> ---
>  .../arietta-g25/rootfs-overlay/etc/network/interfaces          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 board/acmesystems/arietta-g25/rootfs-overlay/etc/network/interfaces
> 
> diff --git a/board/acmesystems/arietta-g25/rootfs-overlay/etc/network/interfaces b/board/acmesystems/arietta-g25/rootfs-overlay/etc/network/interfaces
> new file mode 100644
> index 0000000..2483c5a
> --- /dev/null
> +++ b/board/acmesystems/arietta-g25/rootfs-overlay/etc/network/interfaces
> @@ -0,0 +1,10 @@
> +auto lo
> +iface lo inet loopback
> +
> +auto usb0
> +iface usb0 inet static
> +  address 192.168.10.10
> +  netmask 255.255.255.0
> +  gateway 192.168.10.20

We clearly don't want an overlay that enables a network interface
with some random static IP address. That's really local configuration
that has nothing to do in a Buildroot defconfig IMO.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
