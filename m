From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 20 Aug 2018 19:39:46 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH] synopsys/hsdk: Boot log
 cleanup
Message-ID: <6d8928cc-774f-46ec-9954-f1eedb5279ad@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

20 ???. 2018 ?. 21:15 ???????????? Thomas Petazzoni <thomas.petazzoni@bootlin.com> ???????:
Hello,

On Mon, 20 Aug 2018 18:13:15 +0000, Evgeniy Didin wrote:

> For HSDK board we setup bootargs via device tree, see https://urldefense.proofpoint.com/v2/url?u=https-3A__elixir.bootlin.com_linux_latest_source_arch_arc_boot_dts_hsdk.dts-23L25&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=eU3kSqlMhP-6BXCi_UCQaG6WiY3IlcIyhaNOqFPBaFQ&s=4kRKdEsVzfmbgte8KTrsrpDQ1ULGMZPIzUrr6iCstM0&e=
> "console=ttyS3" was mistakenly placed in u-boot bootargs which are appended to Kernel bootargs.

OK. This must be an ARC-specific behavior, because on ARM, the U-Boot
bootargs *replace* the DT bootargs.

Sorry for my late intervention - I'm enjoying my summer vacation by the sea these days...

In fact there's no special handling of bootargs I. U-Boot for ARC. So either there was some change in upstream U-Boot recently or something went wrong in Evgeniy's exercises.

What's more ttyS3 doesn't exist in HSDK - it was a copy-paste from AXS10x! So what should be done here is replacement of ttyS3 to ttyS0 to match kernel bootargs, see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/boot/dts/hsdk.dts#n25. Otherwise with external .dtb there will be no boot log before getty instantiation in userspace.

Also, Evgeniy could you please provide examples of extra lines in boot log that your patch is supposed to fix?

-Alexey
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180820/8f803ca5/attachment.html>
