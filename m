From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:58:29 +0200
Subject: [Buildroot] [PATCH v2 1/2] ts4900-fpga: add ts4900-fpga package
In-Reply-To: <1474143804-19181-2-git-send-email-mathieu.audat@savoirfairelinux.com>
References: <1474143804-19181-1-git-send-email-mathieu.audat@savoirfairelinux.com>
 <1474143804-19181-2-git-send-email-mathieu.audat@savoirfairelinux.com>
Message-ID: <20160918165829.0420ea4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 16:23:23 -0400, Mathieu Audat wrote:
> This package is responsible from downloading and deploying bitstream for
> TS-4900's FPGA. It implements clocks, UART MUX, and GPIOs. One of these
> GPIOs is used to enable the wifi module.
> 
> It is loaded by U-Boot during the boot sequence, the default U-boot
> script expects to find it in the /boot folder.
> 
> Signed-off-by: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
> ---
>  package/Config.in                    |  1 +
>  package/ts4900-fpga/Config.in        | 11 +++++++++++
>  package/ts4900-fpga/ts4900-fpga.hash |  5 +++++
>  package/ts4900-fpga/ts4900-fpga.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 39 insertions(+)
>  create mode 100644 package/ts4900-fpga/Config.in
>  create mode 100644 package/ts4900-fpga/ts4900-fpga.hash
>  create mode 100644 package/ts4900-fpga/ts4900-fpga.mk

Applied to master with the following changes:

    [Thomas:
     - Use "config" instead of "menuconfig" since there's a single option
       and no sub-options.
     - Add BR2_arm dependency, since it's only used on a specific i.MX6
       platform.
     - Implement TS4900_FPGA_EXTRACT_CMDS that copy the file to the package
       build directory $(@D)
     - Change the install command to copy from $(@D) instead of from
       $(DL_DIR)
     - Change the install command to remove the 'mkdir -p
       $(TARGET_DIR)/boot' and instead just use the -D option of the install
       program that creates the destination directory if it doesn't exist.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
