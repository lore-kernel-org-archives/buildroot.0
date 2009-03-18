From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 18 Mar 2009 12:47:11 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090318112308.GA27893@whatever.nu>
References: <20090318112308.GA27893@whatever.nu>
Message-ID: <20090318114711.GA19956@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 18, 2009 at 12:23:08PM +0100, Per-Henrik Lundblom wrote:
> I have been playing around with buildroot-2009.02 on my PXA270 based
> development board. I have one problem though: I can't really configure
> GCC/uClibC/Linux kernel to use EABI, only OABI. 

You could try using the svn version. There were a number of fixes for
gcc builds, and I'm not totally aware whether they make it to the
release version you got.

Try the following changes, thing work fine here for me, also with
gcc-4.3.2 built for PXA270/300.

> # Automatically generated make config: don't edit
> # Tue Mar 17 13:25:58 2009

[...]

> BR2_xscale=y
> # BR2_iwmmxt is not set
> BR2_ARM_TYPE="ARM_XSCALE"
> # BR2_ARM_OABI is not set
> BR2_ARM_EABI=y
> BR2_ARCH="arm"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_TUNE="xscale"
> BR2_GCC_TARGET_ABI="aapcs-linux"

# BR2_xscale is not set
BR2_iwmmxt=y
BR2_ARM_TYPE="ARM_IWMMXT"
# BR2_ARM_OABI is not set
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="iwmmxt"
BR2_GCC_TARGET_ARCH="iwmmxt"


Daniel
