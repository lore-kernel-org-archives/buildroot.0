From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Aug 2012 21:23:05 +0200
Subject: [Buildroot] [PATCH 3/3] buildroot: toolchain: Allow to build
 gdbserver when external toolchain is selected.
In-Reply-To: <05E9E85E39C35B4D96ED3A3190E35A10C3D77B0E41@LIMKCMBX1.ad.analog.com>
References: <1344251847-7709-1-git-send-email-sonic.adi@gmail.com>
 <1344251847-7709-3-git-send-email-sonic.adi@gmail.com>
 <20120806145441.4dbc10ab@skate>
 <DB904C5425BA6F4E8424B3B51A1414D1714D28600B@NWD2CMBX1.ad.analog.com>
 <CAJxxZ0P+Xg++UGF1SdnsSyW3bua78+txP36FpMWoKNLaGKxQmw@mail.gmail.com>
 <05E9E85E39C35B4D96ED3A3190E35A10C3D77B0E41@LIMKCMBX1.ad.analog.com>
Message-ID: <20120808212305.5c20e240@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 8 Aug 2012 17:29:20 +0100,
"Henderson, Stuart" <Stuart.Henderson@analog.com> a ?crit :

> Since Sonic's linux distro has gdbserver built into it anyway (built
> using the appropriate version of the toolchain), I don't think
> providing gdbserver in the toolchain as well would provide any
> particular benefit to the end user.  Is there a scenario where having
> gdbserver in the toolchain is going to help the user?  I'd happily
> introduce it, if so.

Well, my personal experience (and I've heard this experience from
several other people has well) is that to avoid problems the gdbserver
version you're using should be the same as the cross-gdb used to
connect to this gdbserver. Therefore, it makes sense for a toolchain to
provide both cross-gdb *and* gdbserver, or none of them, but it doesn't
make much sense to offer just cross-gdb without a gdbserver. As I was
mentioning before, Linaro toolchains, Sourcery CodeBench toolchains do
that.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
