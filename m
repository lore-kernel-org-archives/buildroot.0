From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:19:56 +0200
Subject: [Buildroot] [PATCH] package/systemd: Optionally disable hwdb
In-Reply-To: <1460717190-29291-1-git-send-email-m.niestroj@grinn-global.com>
References: <1460717190-29291-1-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <20160615231956.1459c4e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 12:46:30 +0200, Marcin Niestroj wrote:
> By default hwdb files are installed in /usr/lib/udev/hwdb.d
> Currently they take about ~5MB. After first boot, systemd-hwdb tool
> parses them and creates a binary in /etc/udev/hwdb.bin, which takes
> another ~6.5MB.
> 
> In case of initramfs images, hwdb parsing is done every boot. This adds
> about 2-3 seconds to boot time in case of rootfs on SDHC class 10
> card (benchmarked with am335x board). NAND boot takes even longer.
> 
> Add config option to disable hwdb in systemd, for smaller images and
> better boot performance.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/systemd/Config.in  | 11 +++++++++++
>  package/systemd/systemd.mk |  6 ++++++
>  2 files changed, 17 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
