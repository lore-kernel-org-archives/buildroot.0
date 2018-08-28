From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:41:09 +0200
Subject: [Buildroot] [PATCH] package/shairport-sync: add upstream patch
 to fix build issue with soxr
In-Reply-To: <20180828092345.18443-1-joerg.krause@embedded.rocks>
References: <20180828092345.18443-1-joerg.krause@embedded.rocks>
Message-ID: <20180828224109.5db2145f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 11:23:45 +0200, J?rg Krause wrote:
> Add upstream patch to fix build issue detected by the Buildroot autobuilder:
> 
> ```
> arm-buildroot-linux-uclibcgnueabi/sysroot/usr//lib/libsoxr.a(soxr.c.o): In function `soxr_create':
> soxr.c:(.text+0xd4c): undefined reference to `av_get_cpu_flags'
> collect2: error: ld returned 1 exit status
> ```
> 
> A quick look at the soxr source code shows that `soxr_create()` might use
> `av_get_cpu_flags()` depending on the architecture.
> 
> For the sake of simplicity link with `-lavutil` if it is found when using soxr.
> 
> Even better, as soxr provides a pkg-config file, this should be prefered.
> 
> Upstream issue: https://github.com/mikebrady/shairport-sync/issues/733
> Upstream status: 5101ab2d13e2b89ea3c1276df5fb7413634eeccd
> 
> Fixes:
> http://autobuild.buildroot.net/results/53d/53d21686780aa2485745b59e812b6280dd39f1c5
> http://autobuild.buildroot.net/results/605/60576363adfca404c3a7883d5d46e8a4a9ee8171
> http://autobuild.buildroot.net/results/806/806867ab1c6f42ad1b34d44844efc57272d48235
> http://autobuild.buildroot.net/results/840/840810601fbb8a7957ea9dae175b959a7f9b7491
> .. and more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...ibsoxr-is-built-to-rely-on-libavutil.patch | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/shairport-sync/0001-Sometimes-libsoxr-is-built-to-rely-on-libavutil.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
