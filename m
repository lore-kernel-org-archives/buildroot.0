From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 23:09:26 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] cutelyst: link with libatomic when needed
In-Reply-To: <20180828205924.21830-1-fontaine.fabrice@gmail.com>
References: <20180828205924.21830-1-fontaine.fabrice@gmail.com>
Message-ID: <20180828230926.1288e252@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Aug 2018 22:59:24 +0200, Fabrice Fontaine wrote:
> On some architectures, atomic binutils are provided by the libatomic
> library from gcc. Linking with libatomic is therefore necessary,
> otherwise the build fails with:
> 
> sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
> 
> This is often for example the case on sparcv8 32 bit.
> 
> This atomic dependency is due to Qt >= 5.8, pkconfig can't be used as
> Qt5 pc files does not mention this dependency

Perhaps this should be fixed some day :)

> Fixes:
>  - http://autobuild.buildroot.net/results/9e307ab9c7067b26d7b33a572204394808e25772
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

But anyway: applied to master. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
