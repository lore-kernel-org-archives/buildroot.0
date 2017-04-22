From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sat, 22 Apr 2017 12:39:06 +0530
Subject: [Buildroot] [PATCH v9 2/2] Add defconfig for MIPS Creator ci40
In-Reply-To: <20170421185839.17905-2-abhimanyu.v@gmail.com>
References: <20170421185839.17905-1-abhimanyu.v@gmail.com>
 <20170421185839.17905-2-abhimanyu.v@gmail.com>
Message-ID: <CA+NV+VnApSPvcfKTDJh+69AG3uP6An-JVOYM0AXho1MBzYCamw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Apr 22, 2017 at 12:28 AM, Abhimanyu Vishwakarma
<abhimanyu.v@gmail.com> wrote:
> From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
>
> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> ---
>  Changes v1->v2
>   - No change
>  Changes v2->v3 (Suggested by Arnout)
>   - Remove uImage and add fitImage generation
>   - Tidy readme.txt
>   - Tidy ci40_defconfig, remove custom toolchain and add wifi helper packages
>   Some changes are not done:
>   - Using git-helper:
>     - Custom kernel doesnt provide tar file, so it didnt work for me
>  Changes v3->v4 (Suggested by Arnout)
>   - Use github helper for getting kernel/u-boot
>   - rename fitImage.its -> fitImage.its.in to reflect as template file,
>     remove hardcoded dtb filename
>   - Find dtb file in output/images directory and use first dtb in fitImage
>   - Remove image size from genimage.cfg
>   - Tidy readme.txt and add section to explain how to stop u-boot autoboot,
>     how to make it persistent, and other grammar
>  Changes v4->v5 (Suggested by Thomas)
>   - Use fixed kernel entry addr
>   - Generate vmlinux.bin.gz from generate vmlinux.bin
>   - Remove generating uImage (not required for anything now)
>  Changes v5->v6
>   - Use kernel generate fitimage
>   - bump up u-boot version
>   - Change emailid from imgtec.com -> personal id
>  Changes v6->v7 (Suggested by Thomas)
>   - Use genimage.sh script
>   - Improve and fix grammer in readme.txt
>  Changes v7->v8 (Suggested by Arnout)
>   - Use genimage.sh script from POST_IMAGE_SCRIPT
>   - Use uboot kconfig base config
>   - Remove dts config from defconfig
>   - Some other small cleanup
>   - rebase on master
>  Changes v8->v9 (Suggested by Arnout)
>   - Use sh instead of bash where bash feature is not needed
>   - Use sudo for command run on user PC
>   - Update bootloader flashing help text in readme.txt
>
>  board/ci40/genimage.cfg  | 12 +++++++++
>  board/ci40/post-build.sh |  4 +++
>  board/ci40/readme.txt    | 65 ++++++++++++++++++++++++++++++++++++++++++++++++
>  configs/ci40_defconfig   | 48 +++++++++++++++++++++++++++++++++++
>  4 files changed, 129 insertions(+)
>  create mode 100644 board/ci40/genimage.cfg
>  create mode 100755 board/ci40/post-build.sh
>  create mode 100644 board/ci40/readme.txt
>  create mode 100644 configs/ci40_defconfig

Tried usbboot, Ci40 successfully booted using generated sdcard.img.

Tested-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

Thanks,
Rahul
