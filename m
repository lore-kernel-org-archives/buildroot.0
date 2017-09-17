From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:51:25 +0200
Subject: [Buildroot] [PATCH] stella: fix error when building with
 uClibc-ng
In-Reply-To: <1505569029-28935-1-git-send-email-sergio.prado@e-labworks.com>
References: <1505569029-28935-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20170917185125.109ed170@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Sep 2017 10:37:09 -0300, Sergio Prado wrote:
> The uClibc-ng C library defines a type called R0 that conflits with a
> global variable called R0 from PaddleReader.cxx.
> 
> src/emucore/tia/PaddleReader.cxx:25:3: error: ?constexpr const double R0? redeclared as different kind of symbol
>    R0 = 1.5e3,
>    ^
> 
> /home/sprado/workspace/build/buildroot/build/stella_uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/ucontext.h:42:3:note: previous declaration ?<anonymous enum> R0?
>    R0 = 0,
>    ^~
> 
> So let's redefine R0 as a private member of the PaddleReader class.
> 
> This patch has already been accepted upstream [1] and should be removed in
> the next version bump.
> 
> [1] https://github.com/stella-emu/stella/commit/391601d2386e41372d6fa198fbe40287d2e87542
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/9ab5772f01236eaa7def66a2f443f13efca8c34c
> http://autobuild.buildroot.net/results/5a4a194fe85e04ab31b146367c5a45e4f7688fca
> http://autobuild.buildroot.net/results/31f6bb3f5879d056fe152ca19b6b0367cc636212
> ...
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...03-Fix-error-when-building-with-uClibc-ng.patch | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/stella/0003-Fix-error-when-building-with-uClibc-ng.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
