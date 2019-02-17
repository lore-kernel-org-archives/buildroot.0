From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 16:01:15 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/log4cplus: link with libatomic when needed
In-Reply-To: <20190217093326.5528-1-fontaine.fabrice@gmail.com>
References: <20190217093326.5528-1-fontaine.fabrice@gmail.com>
Message-ID: <20190217160115.49390fbe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Feb 2019 10:33:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> On some architectures, atomic binutils are provided by the libatomic
> library from gcc. Linking with libatomic is therefore necessary,
> otherwise the build fails with:
> 
> sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
> 
> This is often for example the case on sparcv8 32 bit.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/16e360cb91afff7655f459a3d1fb906ca48f8464
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix patch so that it applies on current master

Applied to master, thanks. However, as usual, I would prefer an
upstreamable solution that relies on changing the CMakeLists.txt so
that it checks if linking against libatomic is needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
