From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:45:34 +0100
Subject: [Buildroot] [PATCHv2] package/directfb: disable for static
 builds
In-Reply-To: <1487888233-20523-1-git-send-email-yann.morin.1998@free.fr>
References: <1487888233-20523-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170226214534.3c88ac1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 23:17:13 +0100, Yann E. MORIN wrote:
> DirectFB is written in C++, but can be linked to by a C library or
> program.
> 
> When doing shared link, this is fine because the linker gets help from
> the DT_NEEDED flags and knows what libraries to pull in during the link.
> 
> However, during a static link, the linker does not get such help.
> 
> Properly fixing this would require that there is support in pkg-config
> and autotools to specify that the C++ runtime must be linked. Alas there
> is no sush support. The only option is to add -lstdc++ to the
> Libs.Private field in directfb.pc. But this is not upstreamable, because
> there are other C++ runtimes in the wild (e.g. -lc++ from llvm/clang).
> 
> However, DirectFB in a static scenario is probably not a very common
> scenario.
> 
> Disable DirectFB for static builds.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/3d3/3d3036d40ddad71d872d910aae7a24975706d2e9/
>     http://autobuild.buildroot.org/results/d1c/d1c35a6003396942b584f2f2a5e8bf4ac2fbe370/
>     http://autobuild.buildroot.org/results/d45/d4504871bd47930e8363032d380cdfcc5bb8aee7/
>     [...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/directfb/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
