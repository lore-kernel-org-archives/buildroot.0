From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 15:32:40 +0200
Subject: [Buildroot] patch: fix wrong sysroot path when given rsdk
 toolchain
In-Reply-To: <14A4BC6FC7AB3340A49D24D6ACB7BED930620C@RS-MBS02.realsil.com.cn>
References: <14A4BC6FC7AB3340A49D24D6ACB7BED930620C@RS-MBS02.realsil.com.cn>
Message-ID: <20180719153240.25e67cd9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Shawn,

Thanks for your patch, and for contributing to Buildroot!

On Thu, 19 Jul 2018 09:10:03 +0000, ??? wrote:

> The attachment is a patch that fixes a Realtek toolchain that has a
> sysroot path of ?mips-linux-uclibc?, this causes the buildroot
> recognizes the sysroot as ?mips-linux-uc? by the sed operation, and
> then the external toolchain setup is failed. Adding a ?/? in the sed
> re expression avoids the wrong substitution, other toolchains like
> linaro arm toolchain are tested ok to ensure no side effect is
> induced, please help review and apply this patch, thanks.

Would it be possible to get access to this Realtek toolchain? I'd like
to check the behavior, and understand a bit more the issue, because it
looks a bit suspicious/strange.

The sed expression is supposed to replace:

  /path/to/sysroot/usr/lib/libc.a

by:

  /path/to/sysroot/

So I don't quite see how the ending "libc" in mips-linux-uclibc can
affect this.

Also, for your next patches, could you send them with the patch
description in the commit log (currently your commit log is just
"IPCSDK-6460", which is not very useful) ? Also, they should be sent
with "git send-email", so that the patch is inline.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
