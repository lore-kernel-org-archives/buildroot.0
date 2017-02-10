From: Lionel Flandrin <lionel@svkt.org>
Date: Fri, 10 Feb 2017 10:10:31 +0100
Subject: [Buildroot] [PATCH 2/2] u-boot: Add support for Altera mkpimage
 generation
In-Reply-To: <20170209233323.7f57c186@free-electrons.com>
References: <20170128112720.umcchfeyyc7i6rdo@localhost.localdomain>
 <20170130103326.14427-1-lionel@svkt.org>
 <20170130103326.14427-2-lionel@svkt.org>
 <20170209233323.7f57c186@free-electrons.com>
Message-ID: <20170210091030.dalq2ch2xazgb2w7@ed>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 09, 2017 at 11:33:23PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 30 Jan 2017 11:33:26 +0100, Lionel Flandrin wrote:
> > This image format is used by Altera's SoC FPGAs BootROMs.
> > 
> > Signed-off-by: Lionel Flandrin <lionel@svkt.org>
> 
> I missed it on my first review, but it seems like you missed it as
> well: we already have some logic in uboot.mk to call mkpimage. See the
> BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC option.
> 
> This should be extended rather than having two options doing the same
> thing.

I didn't miss it but the existing code is used for u-boot SPL
generation, I didn't think there was an easy way to reuse it for
"full" u-boot packaging (but admitedly my Make-foo is a bit
weak). It's a different set of options.

The previous altera chips only had a 64K internal RAM which meant that
you almost always had to use a SPL to bootstrap the bootloader. The
newer chips however contain 256K of internal RAM so you can fit a full
u-boot in a single stage quite snugly.

> Thanks!
> 
> Thomas

Thank you for reviewing this,
-- 
Lionel Flandrin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170210/7b5e1554/attachment.asc>
