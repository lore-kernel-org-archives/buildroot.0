From: Bruno Kremel <bruno.kremel@gmail.com>
Date: Tue, 22 Aug 2017 01:01:10 +0200
Subject: [Buildroot] Include kernel's dtsi from customised dts in
	buiuldroot-external
References: <87inhgle9f.fsf@gmail.com>
Message-ID: <87h8x0le4p.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I have set up buildroot external for Toradex Colibri iMX6 board. I would
like to customise kernel default dts, so I have made a copy of this dts
to my external board/toradex/colibiri-imx6 and then in the defconfig I
set up the path to custom dts:
BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="$(BR2_EXTERNAL)/board/toradex/colibri-imx6/imx6dl-colibri-mcp-25.dts"

This successfully makes buildroot use my modified dts file. But this
file inludes some kernel dtsi files.
Namely:
#include <dt-bindings/input/input.h>
#include <dt-bindings/interrupt-controller/irq.h>
#include "imx6dl.dtsi"
#include "imx6qdl-colibri.dtsi"

These are however not found by dts compiler during build and I end up
with dtc failing on undefined symbols in devicetree.

How can I specify dts include path such that it will use kernel dtsi
files or what is the correct way to include these from external?

Thanks
Bruno
