From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 10:56:48 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/elfutils: does not
 build with musl
In-Reply-To: <1438983471-26367-1-git-send-email-yann.morin.1998@free.fr>
References: <1438983471-26367-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150808105648.08e04e24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  7 Aug 2015 23:37:51 +0200, Yann E. MORIN wrote:
> elfutils uses so many GNUisms in so many places that patching them out
> is a tedious task which would make us diverge so much from upstream that
> it would become a nightmare to bump elfutils in the future.
> 
> Furthermore, elfutils needs argp, which is missing in musl, so it would
> need argp-standalone too (as when using a uClibc toolchain).
> 
> Make elfutils depend on either glibc or uClibc. argp-standalone is
> already required when using a uClibc toolchain, but since we do not
> support musl, no need to add that to the condition.
> 
> Fixes (configure failures due to missing argp):
>     http://autobuild.buildroot.org/results/743/7432ccd0d060a70bc35f0ac21ec92ae0071592ae/
>     http://autobuild.buildroot.org/results/cc9/cc90bd9312f30f91daa50af4253629f58b82c486/
>     http://autobuild.buildroot.org/results/d5e/d5e583c695afbc2e686e3002765ce9e1937aa0d5/
>     [...]
> 
> Fixes (build failures due to GNUisms):
>     http://autobuild.buildroot.org/results/ee7/ee7eaf80247dd96548d66be9884b179e20204a98/
>     http://autobuild.buildroot.org/results/3f2/3f242853e600bb6bec6ce2f0598d304751ceb81a/
>     http://autobuild.buildroot.org/results/7f0/7f0c7c9cb746104f93907544247bc1008d6ad0dc/
>     [...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/avrdude/Config.in    | 4 +++-
>  package/elfutils/Config.in   | 5 ++++-
>  package/kexec-lite/Config.in | 4 +++-
>  package/ltrace/Config.in     | 4 +++-
>  package/racehound/Config.in  | 4 +++-
>  5 files changed, 16 insertions(+), 5 deletions(-)

I indeed had a look at elfutils some time ago, and it was indeed way
too messy to get it working with musl.

So: applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
