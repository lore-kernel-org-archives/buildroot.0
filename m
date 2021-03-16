From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:31:11 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/mender: Do not automatically
 select uboot tools if uboot is selected
In-Reply-To: <20210315173106.162235-1-aduskett@rivian.com>
References: <20210315173106.162235-1-aduskett@rivian.com>
Message-ID: <20210316213111.2a5a9dcf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Mar 2021 10:31:06 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> From: Adam Duskett <aduskett@gmail.com>
> 
> Because uboot requires a set of unique patches for each board, the upstream
> package developers are phasing out supporting uboot wherever possible.
> Instead, they recommend using Grub2 as a secondary bootloader and using
> the mender-grubenv package.
> 
> Because the mender-grubenv file provides it's own fw_printenv script, it is
> not possible to know if U-Boot's fw_printenv or mender-grubenv's fw_printenv
> should be used.
> 
> As such, remove selecting uboot tools when uboot is selected, and instead add
> a more comprehensive note in the help section about what Mender requires for
> uboot and grub2-based systems, with a link to the meta-mender github project
> for the base uboot patches, and a link to the official documentation on
> manual uboot integration.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/mender/Config.in | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
