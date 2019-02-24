From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 22:07:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/botan: link with libatomic when
 needed
In-Reply-To: <20190215220110.13519-1-fontaine.fabrice@gmail.com>
References: <20190215220110.13519-1-fontaine.fabrice@gmail.com>
Message-ID: <20190224220703.67a37878@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Feb 2019 23:01:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> On some architectures, atomic binutils are provided by the libatomic

built-ins, not "binutils" :-)

> library from gcc. Linking with libatomic is therefore necessary,
> otherwise the build fails with:
> 
> sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
> 
> This is often for example the case on sparcv8 32 bit.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a442734c570e4a02854014d831ba3aab9f592430
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
