From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 14:27:27 +0100
Subject: [Buildroot] [PATCH for-master] package/strace: disable libmpers
 with musl toolchains
In-Reply-To: <1478964612-7028-1-git-send-email-romain.naour@gmail.com>
References: <1478964612-7028-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161113142727.05c93611@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Nov 2016 16:30:12 +0100, Romain Naour wrote:
> strace bundle some kernel headers to build libmpers, this mixes userspace
> headers and kernel headers which break the build with musl.
> The stddef.h from gcc is used instead of the one from musl.
> 
> Disable libmpers for musl toolchains.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6f6/6f63fa2537ff316ba259a20966faadcf5ab9deff
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/strace/strace.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

On #musl:

<amonakov> kos_tom: cross-personality (m32/mx32 from x86-64) strace cannot be built with musl

So, I've applied your patch to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
