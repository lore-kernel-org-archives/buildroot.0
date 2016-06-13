From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:21:44 +0200
Subject: [Buildroot] [PATCH v2 14/14] imx-kobs: bump version to 5.4
In-Reply-To: <e1c8f4349e18c9e1226845c19e5051c179ea5d5a.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <e1c8f4349e18c9e1226845c19e5051c179ea5d5a.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-yvLCGR-XXKHTqBS022nSWsqtL_DkgH0GSDLP5vCYqkMhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:14 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> - Check raw mode flag for backward compatbility
> - Fix membership name in bch geometry structure.
> - Fix the previous implementation that may ruin the BBM
> - Adapt raw page accesses to match the new raw_read/write implementation
>
> The old raw access implementation (in GPMI driver) was considering that
> data and OOB data were separated in their respective regions (the data
> area and the OOB area of the page), which is not true.
> They are actually interleaved this way:
>
> METADATA + ((DATA + ECCBYTES) * N)
>
> The new raw access implementation (in the GPMI driver) is hiding this
> weird
> layout to MTD users by exposing a more common layout:
>
> DATA + METADATA + (N * ECCBYTES)
>
> Here METADATA + (N * ECCBYTES) are exposed as if they were stored in the
> OOB area.
>
> Unfortunately kobs-ng rely on this weird layout when accessing the NAND
> in raw mode.
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/a7545b1
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Cannot test it since I don't own a platform with NAND but the build is fine.

Regards,
Gary
