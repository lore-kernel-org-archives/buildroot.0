From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:08:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/kf5-modemmanager-qt: link with
 libatomic when needed
In-Reply-To: <20190317211016.2052-1-fontaine.fabrice@gmail.com>
References: <20190317211016.2052-1-fontaine.fabrice@gmail.com>
Message-ID: <20190318220820.09814d6e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 22:10:16 +0100
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
>  - http://autobuild.buildroot.org/results/b941a3deaa57cac79f1686d47ca6ababf2f0d5e4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks. As usual, I would prefer an upstreamable
fix, though.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
