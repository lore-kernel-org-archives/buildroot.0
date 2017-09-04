From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 4 Sep 2017 20:42:20 +0300
Subject: [Buildroot] [PATCH v2 1/1] New board: SolidRun ClearFog Base
In-Reply-To: <286913cf8082a174d123f2581b9e61ad5250d8b7.1504541978.git.jan.kundrat@cesnet.cz>
References: <20170904104128.rbpp3qjkgyi6kafu@sapphire.tkos.co.il>
 <286913cf8082a174d123f2581b9e61ad5250d8b7.1504541978.git.jan.kundrat@cesnet.cz>
Message-ID: <20170904174220.xeweolump7hsgfqm@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

On Mon, Sep 04, 2017 at 04:58:10PM +0200, Jan Kundr?t wrote:
> My goal was to rely on upstreamed features as much as possible, which
> means that some bits are only half-baked for now:
> 
> - Due to the DTS restructuring in upstream kernel, we require 4.11+. The
> latest LTS or CIP kernels do not know about the -Base model.
> 
> - Linux has no generic support for SFP cages (yet). It seems that this
> has hit the net-next tree in August 2017, but there's been no release
> (it's probably targettting 4.14). Also, the merge only included the
> required infrastructure; the mvneta driver conversion is not included.
> Patches which finalize this exist in Russel King's tree and also in
> random vendor trees.
> 
> - There's no access to the SPI flash in these versions of
> uboot/linux/dts.

This information belongs (also) in the readme.txt file, I believe.

> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

[...]

> diff --git a/board/solidrun/clearfog/readme.txt b/board/solidrun/clearfog/readme.txt
> new file mode 100644
> index 0000000..0962d49
> --- /dev/null
> +++ b/board/solidrun/clearfog/readme.txt
> @@ -0,0 +1,62 @@
> +**********************
> +SolidRun Clearfog Base
> +**********************
> +
> +This file documents Buildroot's support for the Clearfog Base by Solid Run.
> +
> +Vendor's documentation:
> +https://wiki.solid-run.com/doku.php?id=products:a38x:documents
> +
> +Warning for eMMC variant of the MicroSoM
> +========================================
> +
> +If you bought a MicroSoM version that includes an on-board eMMC flash, the
> +built-in microSD card slot *WILL NOT WORK*. The Internet says that you have to
> +upload the first bootloader via UART. This manual does not cover these steps;
> +only MicroSoMs without the eMMC are supported.

As far as I know all eMMC SOMs are pre-loaded with a bootloader. But you are 
right that this README doesn't cover these.

[...]

> +Boot the Clearfog board
> +=======================
> +
> +Here's how to boot the board:
> +
> +- Set up the DIP switches for microSD boot. The correct values are:
> +  1: off, 2: off, 3: ON, 4: ON, 5: ON. In this scheme, switch #1" is closer to
> +  the ethernet ports and #5 is closer to the microSD card, "ON" means towards
> +  the SOM, and "off" means towards the SFP cage. Yes, it's different than what
> +  the vendor says in the manual.

These DIP switches settings looks exactly the same as in the wiki page[1]. 
Note the comment below the diagram.

[1] https://wiki.solid-run.com/doku.php?id=products:a38x:clearfog#bootdevice_dipswitch

> +- Connect to the board's console over the microUSB port.
> +- Insert the SD card into the slot on the board (pins up).
> +- Power up the board.

[...]

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
