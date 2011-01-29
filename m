From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jan 2011 09:50:38 +0100
Subject: [Buildroot] problems building w/ external glibc toolchain
In-Reply-To: <AANLkTi=LxaU-+wms053YX-BFrv3nQQod0mimafS7D=4K@mail.gmail.com>
References: <AANLkTi=LxaU-+wms053YX-BFrv3nQQod0mimafS7D=4K@mail.gmail.com>
Message-ID: <20110129095038.11522bdb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bryce,

On Fri, 28 Jan 2011 16:23:30 -0800
Bryce Schober <bryce.schober@gmail.com> wrote:

> I've built an external glibc toolchain using crosstool-ng with old
> (2.6.29.6) linux kernel headers. I've already tested that the toolchain
> basically works, but buildroot fails just after building cross-depmod26.
> I've build with the --debug=v option, and it seems like it's trying to go
> fetch kernel headers, but doesn't know the kernel version. Looking into the
> configs and makefiles, it seems that the config variables for the kernel
> header versions are unsettable when using an external toolchain, yet
> buildroot is going out and trying to download them without knowing the
> version, eventually resulting in:
> 
> Must remake target `/home/bschober/buildroot-2010.02/dl/linux-..tar.bz2'.
> 
> Which is clearly never going to work. You'll noticed that this happened
> using buildroot-2010.02, but I've reproduced the same behavior on 2010.11
> and need to use the old version because I need Xorg 7.4.

Sounds strange. Could you post : your Buildroot .config, the complete
build log, and the list of commands you're using to trigger the
problem ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
