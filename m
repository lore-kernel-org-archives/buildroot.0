From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 17:31:44 +0200
Subject: [Buildroot] [PATCHv3 08/14] configs: use new EABIhf option for
	beaglebone_defconfig
In-Reply-To: <CAEBucnDrCWq5-B2N9=CEY3OSuu+w+x3ve-uh801Q8om73wF6zQ@mail.gmail.com>
 (Spenser Gilliland's message of "Tue, 16 Jul 2013 10:06:22 -0500")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <8761wa1w3b.fsf@dell.be.48ers.dk> <20130716153258.1f2c3201@skate>
 <87bo62zks8.fsf@dell.be.48ers.dk> <20130716154704.35933a60@skate>
 <CAEBucnDrCWq5-B2N9=CEY3OSuu+w+x3ve-uh801Q8om73wF6zQ@mail.gmail.com>
Message-ID: <8738rezfkv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

Hi,

 Spenser> FWIW; The following thread explains the situation for UBoot

 Spenser> http://u-boot.10912.n7.nabble.com/U-Boot-RFC-PATCH-ARMV7-Patch-to-fix-hard-float-build-issues-td22107.html

Thanks.

 Spenser> IMHO: the simple solution could be to just do a CFLAGS=$(filter
 Spenser> -mfloat-abi=hard, $(TARGET_CFLAGS)) when passing to uboot as uboot
 Spenser> should not generate any float code at all.

That unfortunately doesn't work as -mfloat-abi=hard is baked into the
toolchain wrapper. I'm afraid the only solution is to detect
-mfloat-abi=soft* in the wrapper and then skip -mfloat-abi=hard like
Thomas suggested - Or to rely on the defaults of the toolchain and never
pass it.

-- 
Bye, Peter Korsgaard
