From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Feb 2019 22:05:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcpprestsdk: link with
 libatomic when needed
In-Reply-To: <20190215213315.31969-1-fontaine.fabrice@gmail.com>
References: <20190215213315.31969-1-fontaine.fabrice@gmail.com>
Message-ID: <20190224220547.0ae5e219@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Feb 2019 22:33:15 +0100
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
>  - http://autobuild.buildroot.org/results/983537ceb38add50ca0a2316f39a2964db1b83c5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcpprestsdk/libcpprestsdk.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
