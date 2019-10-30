From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Oct 2019 11:30:40 +0100
Subject: [Buildroot] [PATCH 2/2] package/libv4l: link with libatomic
 when needed
In-Reply-To: <20191030065303.22948-2-bernd.kuhls@t-online.de>
References: <20191030065303.22948-1-bernd.kuhls@t-online.de>
 <20191030065303.22948-2-bernd.kuhls@t-online.de>
Message-ID: <20191030113040.474a31f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Oct 2019 07:53:03 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> On some architectures, atomic operations are provided by the libatomic
> library from gcc. Linking with libatomic is therefore necessary,
> otherwise the build fails with:
> 
> /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>  qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
> 
> This is often for example the case on sparcv8 32 bit.
> 
> Fixes:
> http://autobuild.buildroot.net/results/089/08952dbf89bf3c49da7697943441cee411940420/

The LIBV4L_AUTORECONF = YES that was kept in
d0f3c9de49bfe3f8ac6e75a706540eefcc1afc07 was intended to fix this
libatomic linking issue, so I'm a bit confused.

Could you discuss this with Peter Seiderer (in Cc) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
