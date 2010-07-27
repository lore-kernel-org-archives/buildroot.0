From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 17:17:54 +0200
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <201007270314.15113.PeterHuewe@gmx.de>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
	<AANLkTi=x4Ez1ZimcV4Nc3aCym=+K=ds9zUaM0uae_RWa@mail.gmail.com>
	<20100723231850.636bfab9@surf>
	<201007270314.15113.PeterHuewe@gmx.de>
Message-ID: <20100727171754.59da191e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue, 27 Jul 2010 03:14:14 +0200
Peter H?we <PeterHuewe@gmx.de> wrote:

> I just tried to compile the atngw100_defconfig using your patch and
> the latest git repo but unfortunately it fails while building host-lzo
> 
> >>> host-lzo 2.03 Configuring

host-lzo is built for the host, so it's quite unlikely that any AVR32
change can have an impact on it.

> configure: loading cache /avr/buildroot/output/build/host-config.cache
> configure: Configuring LZO 2.03
> checking build system type... (cached) x86_64-unknown-linux-gnu
> checking host system type... (cached) x86_64-unknown-linux-gnu
> checking target system type... config.sub: missing argument
> Try `config.sub --help' for more information.

It sounds like the autoconf host-config.cache has been filled with an
empty value for --target.

Can you show the contents
of /avr/buildroot/output/build/host-config.cache after the failure, and
can you post the *full* build log somewhere ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
