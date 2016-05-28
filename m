From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 15:41:58 +0200
Subject: [Buildroot] [PATCH v3 5/6] package/flannel: Add
 BR2_TOOLCHAIN_HAS_THREADS
In-Reply-To: <627469f0b7b4e604da3a5ab3ef721f138a1c95a8.1464286518.git.geoff@infradead.org>
References: <cover.1464286518.git.geoff@infradead.org>
 <627469f0b7b4e604da3a5ab3ef721f138a1c95a8.1464286518.git.geoff@infradead.org>
Message-ID: <20160528154158.70f4f025@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 18:21:33 +0000, Geoff Levand wrote:
> flannel uses the cgo package, so needs a toolchain with thread
> support.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/flannel/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

There are still some issues with the flannel build:

  http://autobuild.buildroot.org/results/d98/d98e1857590738313a293b58f02230539bbaa405/build-end.log

The error is:

/home/buildroot/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find Scrt1.o: No such file or directory

My understanding is that this happens when trying to build PIE binaries
that are statically linked. uClibc does not support that, or at least
not with our current toolchain support. Would it be possible to not
build PIE binaries with Go ? Or alternatively, investigate if it can be
fixed in uClibc ?

Waldemar, maybe you have some input about this problem ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
