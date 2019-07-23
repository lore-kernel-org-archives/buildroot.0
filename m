From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 23 Jul 2019 08:16:45 -0400
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add missing
 host-uboot-tools select
In-Reply-To: <20190723040220.scotkwrqgsxjcsjl@sapphire.tkos.co.il>
References: <20190723013424.1827-1-danomimanchego123@gmail.com>
 <20190723040220.scotkwrqgsxjcsjl@sapphire.tkos.co.il>
Message-ID: <CANxTyt6eBFuMTicjL7ZGGGGwkQX9kOWx621aJEZ6bxaYR92nsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Tue, Jul 23, 2019 at 2:32 AM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Danomi,
>
> On Mon, Jul 22, 2019 at 09:34:24PM -0400, Danomi Manchego wrote:
> > The "Build BL31 U-Boot image" option uses mkimage to make atf-uboot.ub,
> > and has a make dependency on host-uboot-tools.  Therefore, the Config.in
> > option should select BR2_PACKAGE_HOST_UBOOT_TOOLS.  (Just like similar
> > options in linux, package/xvisor, and fs/cpio.)
> >
> > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> > ---
> >  boot/arm-trusted-firmware/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> > index beb95fb..2e41bd0 100644
> > --- a/boot/arm-trusted-firmware/Config.in
> > +++ b/boot/arm-trusted-firmware/Config.in
> > @@ -86,6 +86,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
> >  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT
> >       bool "Build BL31 U-Boot image"
> >       select BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
> > +     select BR2_PACKAGE_HOST_UBOOT_TOOLS
>
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT adds host-uboot-tools to
> ARM_TRUSTED_FIRMWARE_DEPENDENCIES already. Why isn't that enough?
>
> baruch

Well, why isn't the dependency enough in xvisor for the
BR2_PACKAGE_XVISOR_CREATE_UBOOT_IMAGE option?  Why isn't it enough in
cpio for the BR2_TARGET_ROOTFS_CPIO_UIMAGE option?  I don't know, but
I imagine that the answer is partially due to "truth in advertising"
with regards to the menu configuration (because "host uboot-tools" can
*appear* to be deselected but it gets built anyway if something
depends on it but does not select it).

Isn't consistency with the other places reason enough?

Danomi -

>
> >       help
> >         Generates a U-Boot image named atf-uboot.ub containing
> >         bl31.bin.  This is used for example by the Xilinx version of
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
