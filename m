From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:46:07 +0100
Subject: [Buildroot] [PATCH v2] package/guile: dont't use -Os for CS
 2014.05 ARM toolchain
In-Reply-To: <1478472812-30673-1-git-send-email-romain.naour@gmail.com>
References: <1478472812-30673-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161109224607.4775965b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Nov 2016 23:53:32 +0100, Romain Naour wrote:
> With this toolchain, guile tigger an assembler error with -Os which is
> probably caused by the binutils version being used:
> 
> arm-none-linux-gnueabi-ld --version
> GNU ld (Sourcery CodeBench Lite 2014.05-29) 2.24.51.20140217
> 
> arm-none-linux-gnueabi-gcc --version
> arm-none-linux-gnueabi-gcc (Sourcery CodeBench Lite 2014.05-29) 4.8.3 20140320 (prerelease)
> 
> Nowaday, even with a Buildroot internal toolchain using the oldest
> Binutils GCC version (2.25.1 and 4.8.6), guile build fine with -Os.
> 
> So, force -O2 when this toolchain is used and BR2_OPTIMIZE_S is set.
> 
> Fixes:
> http://autobuild.buildroot.net/results/976/976b3477407e64c8c2fc2309ed952d0083903a19
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: force -O2 instead of disaling the toolchain for guile
> ---
>  package/guile/guile.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
