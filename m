From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Aug 2019 09:22:58 +0200
Subject: [Buildroot] [PATCH 1/1] board/mender: add a mender board
 example configuration.
In-Reply-To: <20190826203619.71720-2-aduskett@gmail.com>
References: <20190826203619.71720-1-aduskett@gmail.com>
 <20190826203619.71720-2-aduskett@gmail.com>
Message-ID: <20190827092258.04dc6df6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Mon, 26 Aug 2019 13:36:19 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Buildroot currently has all of the needed packages to use Mender as the primary
> update system. However; there isn't any documentation or examples now that
> provide a starting point for users. This lack of documentation makes setting up
> a Mender based update system difficult and time-consuming.
> 
> Provided in this patch series is a mender_x86_64_efi_defconfig -that sets up an
> x86_64 EFI based build that is ready to flash to a USB pen drive or use in a
> QEMU environment. The system partition exchema comprises of two equally sized
> root partitions and a 64M data partition that is mounted to /var/lib/mender as
> a persistent data store partition.
> 
> There is a board/mender/readme.txt provided which gives users documentation on
> how to flash the built image or boot the image using QEMU as well.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Thanks for proposing this. I am wondering if adding more and more
defconfigs is the right way of "documenting" things like that. It
definitely makes sense to have some documented examples/demos to show
how to use a particular feature, but I don't know if defconfigs are the
right way. Or if they are, perhaps we should have a way to clearly
distinguish the regular defconfigs (i.e minimal ones just to get
started with a HW platform) from the demo/example ones.

> diff --git a/board/mender/post-image-efi-gpt.sh b/board/mender/post-image-efi-gpt.sh
> new file mode 100755
> index 0000000000..76ddfa5d47
> --- /dev/null
> +++ b/board/mender/post-image-efi-gpt.sh

Please use the genimage capability to generate GPT partition tables. It
wasn't supported in genimage back when the pc_x86_64_efi_defconfig was
introduced, but there is a patch pending in patchwork to convert
pc_x86_64_efi_defconfig to use this genimage capability.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
