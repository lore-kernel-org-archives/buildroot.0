From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 17:23:02 +0200
Subject: [Buildroot] [PATCHv3 08/14] configs: use new EABIhf option for
 beaglebone_defconfig
In-Reply-To: <CAEBucnDrCWq5-B2N9=CEY3OSuu+w+x3ve-uh801Q8om73wF6zQ@mail.gmail.com>
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <8761wa1w3b.fsf@dell.be.48ers.dk> <20130716153258.1f2c3201@skate>
 <87bo62zks8.fsf@dell.be.48ers.dk> <20130716154704.35933a60@skate>
 <CAEBucnDrCWq5-B2N9=CEY3OSuu+w+x3ve-uh801Q8om73wF6zQ@mail.gmail.com>
Message-ID: <20130716172302.61af23e1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Tue, 16 Jul 2013 10:06:22 -0500, Spenser Gilliland wrote:

> In summary, uboot will keep -msoft-float and will not accept the patch
> for reasons of preventing possible floating point assembly being
> generated.
> 
> IMHO: the simple solution could be to just do a CFLAGS=$(filter
> -mfloat-abi=hard, $(TARGET_CFLAGS)) when passing to uboot as uboot
> should not generate any float code at all.

That's not possible because -mfloat-abi=hard is not passed through
CFLAGS, but directly hardcoded into the external toolchain wrapper. The
reasoning for hardcoding that into the external toolchain wrapper is
that people using $(O)/host/usr/bin/<arch>-gcc to build their own stuff
outside of Buildroot will automagically get the proper flags, without
having to worry about this.

So we can't just "filter" flags in uboot.mk as you suggest,
unfortunately.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
