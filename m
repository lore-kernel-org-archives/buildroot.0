From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 22:56:28 +0200
Subject: [Buildroot] [PATCH v2] synopsys/hsdk: Linux Boot log cleanup
In-Reply-To: <20180821133244.39822-1-Evgeniy.Didin@synopsys.com>
References: <20180821133244.39822-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20180910225628.13078b62@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 16:32:44 +0300, Evgeniy Didin wrote:
> This patch removes duplicate messages in Linux log on HSDK board.
> For HSDK board we setup bootargs via device tree,
> see https://elixir.bootlin.com/linux/latest/source/arch/arc/boot/dts/hsdk.dts#L25
> "console=ttyS3" was mistakenly placed in u-boot bootargs which are
> appended to Kernel bootargs in case of using buildin .dtb.
> 
> Before patch log is like:
> ------------------------8<-------------------------------------
> mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 25000000Hz,...
> mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 25000000Hz,...
> mmc0: new SDHC card at address 59b4
> mmc0: new SDHC card at address 59b4
> blk_queue_max_segment_size: set to minimum 8192
> blk_queue_max_segment_size: set to minimum 8192
> ------------------------>8-------------------------------------  

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
