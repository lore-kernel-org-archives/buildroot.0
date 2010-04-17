From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Apr 2010 17:07:52 +0200
Subject: [Buildroot] codesourcery as external toolchain
In-Reply-To: <n2o5fbe85791004162357h11a18ae5v1db91f6fefb81db6@mail.gmail.com>
References: <n2k5fbe85791004140147maf9b040cx4f4adeda4ce1c339@mail.gmail.com>
	<20100417021617.502e76f8@surf>
	<n2o5fbe85791004162357h11a18ae5v1db91f6fefb81db6@mail.gmail.com>
Message-ID: <20100417170752.38a18d39@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please reply to the Buildroot mailing-list and not to me directly,
thanks!

On Sat, 17 Apr 2010 08:57:19 +0200
Atom Proton <atomx01@gmail.com> wrote:

> Thanks for your answer. I'm apply your changes, and now is working
> arm-none-linux-gnueabi toolchain ( tested version:
> http://www.codesourcery.com/downloads/public/gnu_toolchain/arm-none-linux-gnueabi/arm-2009q3-67-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2).

Great!

> But I wont use uClibc (arm-uclinuxeabi toolchain), and this is don't
> working now. I have tested
> http://www.codesourcery.com/downloads/public/gnu_toolchain/arm-uclinuxeabi/arm-2009q1-163-arm-uclinuxeabi-i686-pc-linux-gnu.tar.bz2.
> Here is the output of compilation with arm-uclinuxeabi toolchain:

This is not a Linux/uClibc toolchain, but a uClinux toolchain. It
generates FLAT binaries, for no-MMU targets. This type of toolchain is
currently unsupported in Buildroot, because we don't have support for
no-MMU (it might be added in the future, but we don't have it at the
moment).

I don't think CodeSourcery provides Linux/uClibc toolchains. If you
want one, I think you have no other solutions that building your own,
using Crosstool-NG.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
