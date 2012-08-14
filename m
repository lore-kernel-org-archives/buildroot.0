From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Aug 2012 14:25:40 +0200
Subject: [Buildroot] [PATCH 3/3] buildroot: toolchain: Allow to build
 gdbserver when external toolchain is selected.
In-Reply-To: <05E9E85E39C35B4D96ED3A3190E35A10C3D786052C@LIMKCMBX1.ad.analog.com>
References: <1344251847-7709-1-git-send-email-sonic.adi@gmail.com>
 <1344251847-7709-3-git-send-email-sonic.adi@gmail.com>
 <20120806145441.4dbc10ab@skate>
 <DB904C5425BA6F4E8424B3B51A1414D1714D28600B@NWD2CMBX1.ad.analog.com>
 <CAJxxZ0P+Xg++UGF1SdnsSyW3bua78+txP36FpMWoKNLaGKxQmw@mail.gmail.com>
 <05E9E85E39C35B4D96ED3A3190E35A10C3D77B0E41@LIMKCMBX1.ad.analog.com>
 <20120808212305.5c20e240@skate>
 <05E9E85E39C35B4D96ED3A3190E35A10C3D786052C@LIMKCMBX1.ad.analog.com>
Message-ID: <20120814142540.7b0ade51@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 14 Aug 2012 12:06:38 +0100,
"Henderson, Stuart" <Stuart.Henderson@analog.com> a ?crit :

> >Well, my personal experience (and I've heard this experience from several other people has well)
> >is that to avoid problems the gdbserver version you're using should be the same as the cross-gdb
> >used to connect to this gdbserver. Therefore, it makes sense for a toolchain to provide both cross-gdb
> >*and* gdbserver, or none of them, but it doesn't make much sense to offer just cross-gdb without a
> >gdbserver. As I was mentioning before, Linaro toolchains, Sourcery CodeBench toolchains do that.
> 
> This seems reasonable, however we only support matching releases of the toolchain/u-boot/linux, so the result is much the same.
> i.e. The 2012R1 release of the toolchain is used to build the 2012R1 release of u-boot and linux.  The latter of which contains the correct version of gdbserver for the 2012R1 release of the toolchain.

I am not sure to understand: why would gdbserver be part of your
"linux" release? Linux is the kernel, was does it has to do with
gdbserver.

> However, like I said, I certainly don't have any strong objections to having gdbserver in the toolchain package as well.  I'll take a look at how other people package it and see what Sonic's thoughts are on it when we're doing the next release.

Ok, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
