From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 21:30:08 +0200
Subject: [Buildroot] [PATCH] roseapplepi: backport upstream patches to
 fix build with gcc 6
In-Reply-To: <20170620114952.16292-1-peter@korsgaard.com>
References: <20170620114952.16292-1-peter@korsgaard.com>
Message-ID: <20170620213008.652bc050@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jun 2017 13:49:52 +0200, Peter Korsgaard wrote:
> The recent change to default to gcc 6 for the internal toolchain broke this
> defconfig as the u-boot and linux kernel are too old to build with gcc 6.
> 
> Fit it by backporting the following commits:
> 
> - u-boot: 9b2c282b34 (compiler*.h: sync include/linux/compiler*.h with Linux 4.5-rc6)
> - linux:  cb984d101b (compiler-gcc: integrate the various compiler-gcc[345].h files)
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
> Andreas F?rber has recently contributed minimal mainline Linux support for
> this SoC, so I'll have a look at migrating to that once it ends up in Linus'
> tree:

I've applied to master. But to be honest, I'm not thrilled with the idea
of adding 1100+ lines of patches just to make one single defconfig build
again with gcc 6.x. If the kernel doesn't build with gcc 6.x, it means
the HW platform is poorly maintained, and it will become worse and
worse.

Perhaps for such platforms we should change the defconfig to use gcc
5.x (or whatever older version works). And once we remove the support
for those older gcc versions, drop the defconfig as well.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
