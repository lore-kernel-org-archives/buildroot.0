From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 20:32:00 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fix check-musl
In-Reply-To: <1417648439-10146-1-git-send-email-jkrause@posteo.de>
References: <1417648439-10146-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141208203200.4ca75210@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu,  4 Dec 2014 00:13:59 +0100, J?rg Krause wrote:
> check_musl works fine for the external musl 1.1.1 toolchain which is downloaded
> and installed, but fails for a musl toolchain which, in a first step is build
> by the internal toolchain backend of Buildroot, and in a second step is copied
> to an external directory and imported as an custom external toolchain (in a new
> configuration).
> 
> In case of the downloaded musl 1.1.1 toolchain the libc.so and libm.a files
> reside in the sysroot/lib directory and sysroot/usr/lib is a symlink to
> sysroot/lib.
> 
> In case of the custom musl toolchain build by Buildroot the files reside in
> sysroot/usr/lib which is not a symlink.

Actually, I am not sure this is the best fix we could do. Having the C
library installed in /usr/lib in the sysroot is a bit weird, and I
believe we should rather fix the Buildroot musl package to ensure that
the C library gets installed in /lib instead.

Do you want to have a look into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
