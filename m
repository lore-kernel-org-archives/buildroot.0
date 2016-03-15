From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Tue, 15 Mar 2016 16:07:28 +0100
Subject: [Buildroot] [rpi-firmware] I can't find the file
	/usr/sbin/vcdbg after compiling
Message-ID: <CALtfCQYaW4JsQiBOC+paK2+gzPVfdOSsKWXr-qBqkv_tXC23sA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, I did both, but I've just checked again and It doesn't work.

../output/target/usr/sbin$ ls
addgroup  chroot    deluser   ether-wake  i2cdetect  i2cset    loadfont
setlogcons
adduser   crond     dnsd      fbset       i2cdump    inetd     rdate
 vcfiled
arping    delgroup  dropbear  fdformat    i2cget     killall5  readprofile

Oscar Gomez Fuente.

On 11 March 2016 at 15:31, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "?scar" == ?scar G?mez Fuente <oscargomezf@gmail.com> writes:
>
>  > Hi,
>  > I'm using the last release buildroot-2016.02 and I'm trying to test some
>  > dtb files on my raspberry pi 2 (because It seems to be it doesn't work
>  > well) so I'm trying to add the package to debug vcdbg:
>
>  > Target package ---> Hardware handling  ---> Firmware ---> vcdbg
>
>  > The compilation was successful but the file /usr/sbin/vcdbg doesn't
> exist
>  > in the $TARGET_DIR
>
> From package/rpi-firmware/rpi-firmware.mk:
>
> ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
> define RPI_FIRMWARE_INSTALL_TARGET_CMDS
>         $(INSTALL) -d -m 0700 $(@D)/$(if
> BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
>                 $(TARGET_DIR)/usr/sbin/vcdbg
> endef
> endif # INSTALL_VCDBG
>
> So it should be in usr/sbin. Did you do a clean build (or at least rm
> -rf output/build/rpi-firmware-*) when you enabled the VCDBG option?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160315/6431a4ff/attachment.html>
