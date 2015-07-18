From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 23:18:37 +0200
Subject: [Buildroot] [PATCH v4 2/7] host-zynq-boot-bin: new package
In-Reply-To: <20150714171413.26a16828@pcviktorin.fit.vutbr.cz>
References: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
 <20150714171413.26a16828@pcviktorin.fit.vutbr.cz>
Message-ID: <20150718231837.0a5b01b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On Tue, 14 Jul 2015 17:14:13 +0200, Jan Viktorin wrote:
> The package provides a Python script that can create
> the file BOOT.BIN to boot Xilinx Zynq based boards.
> 
> The script zynq-boot-bin.py is contained in the
> Xilinx repository of U-Boot (it is not in upstream).
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  package/Config.in.host                   |  1 +
>  package/zynq-boot-bin/Config.in.host     |  8 ++++++++
>  package/zynq-boot-bin/zynq-boot-bin.hash |  2 ++
>  package/zynq-boot-bin/zynq-boot-bin.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/zynq-boot-bin/Config.in.host
>  create mode 100644 package/zynq-boot-bin/zynq-boot-bin.hash
>  create mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk

I've done quite a few changes:

    [Thomas:
     - remove appearance of the package in menuconfig, U-Boot will depend
       on it directly, so there's no need for it to appear in menuconfig
     - use $(INSTALL) instead of cp for the installation
     - remove @ before the extract and install commands.]

and applied the patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
