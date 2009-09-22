From: Anders Darander <anders.darander@gmail.com>
Date: Tue, 22 Sep 2009 08:38:16 +0200
Subject: [Buildroot] Buildroot 2009.08 fails to build working rootfs
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB69B010BD@MAIL-UA.ccs.local>
References: <330EC2471BF24E48B513AF1A6975EB69B00E3F@MAIL-UA.ccs.local>
	<330EC2471BF24E48B513AF1A6975EB69B00F9F@MAIL-UA.ccs.local>
	<4AB8016F.1020506@atmel.com>
	<330EC2471BF24E48B513AF1A6975EB69B010BD@MAIL-UA.ccs.local>
Message-ID: <2c9a759f0909212338i56340c07lee6291d2ed518bed@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 22, 2009 at 07:50, Teemu Keskinarkaus
<Teemu.Keskinarkaus@cc-systems.com> wrote:
> I changed the project name and also the kernel version. Those two are
> not related together. Then I make the buildroot and sure enough, the
> libraries are missing from the new root-directory. After 'make clean'
> the make generated rootfs that has all needed libraries too. Earlier I
> couldn't done 'make clean' since the project name had changed and 'make
> clean' failed.

If the missing libraries comes from the external toolchain, then it is
quite likely that they aren't going to be copied to the rootfs again,
if you remove the rootfs (or renamed the project). As long as the
stamp-file in build_*/stamps/ext-toolchain-installed is left, the
external toolchain is not reinstalled. If you remove this file, the
toolchain will get reinstalled, together with all libraries to the
rootfs.

> So it seems that 'make clean' is needed to be able to regenerate
> root-directory. This might be related to external toolchain. Not that I
> mind, but it takes way longer to use 'make clean' and 'make' rather than
> just removing the old root-directory and say 'make'. Also other
> modifications might be lost.

So yes, it's quite likely related to the external toolchain.

Regards,
Anders

-- 
Anders Darander
