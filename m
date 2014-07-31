From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:54:03 +0200
Subject: [Buildroot] [PATCH 1/2 v2] toolchain: linker options with a $
 sign are not supported
In-Reply-To: <4340ac304e166f70044180b7d49eb6e43828eace.1406760999.git.yann.morin.1998@free.fr>
References: <cover.1406760999.git.yann.morin.1998@free.fr>
 <4340ac304e166f70044180b7d49eb6e43828eace.1406760999.git.yann.morin.1998@free.fr>
Message-ID: <20140731235403.0d3d5baa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 31 Jul 2014 00:57:15 +0200, Yann E. MORIN wrote:
> As reported in bug #7172 [0], setting BR2_TARGET_LDFLAGS to a value
> containing a $ sign can lead to unexpected results.
> 
> This is because it is very hard to know when the $ sign gets evaluated:
>   - in the Buildroot-level make
>   - in the shell called by the Buildroot-level make
>   - in the package's own build-system, either at configure time, in the
>     Makefile, in a shell in the Makefile...
> 
> So, it is very difficult to know how much escaping that would need.
> 
> A proposal is to use a shell variable to pass such values unmolested.
> But it is not that simple either, since it still contains a $ sign, and
> there is not much certainty as to when it would be evaluated.
> 
> Instead, just document this limitation, both in the help text for
> BR2_TARGET_LDFLAGS, and in the known-issues section in the manual.
> 
> Does not really fix #7172, but at least the limitation is documented.
> 
> [0] https://bugs.buildroot.org/show_bug.cgi?id=7172
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Mike Zick <minimod@morethan.org>
> ---
>  docs/manual/known-issues.txt  | 4 ++++
>  toolchain/toolchain-common.in | 3 +++
>  2 files changed, 7 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
