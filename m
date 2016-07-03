From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 13:20:11 +0200
Subject: [Buildroot] [PATCH] core/pkg-virtual: fix fallout of
 host-dependecy no auto-derivation
In-Reply-To: <1467542683-31934-1-git-send-email-yann.morin.1998@free.fr>
References: <1467542683-31934-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160703132011.14e94d09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 12:44:43 +0200, Yann E. MORIN wrote:
> In 4bdb067 (infra: remove auto derivation of host dependencies), the
> dependencies of host packages are not longer inherited from the
> dependencies of the corresponding target package.
> 
> However, for virtual packages, there is no provider declared for the
> host variant, so we end up with no dependency for the  host variants
> of virtual packages.
> 
> This causes host-luainterpreter to have no provider, and thus breaks the
> build of host-luarocks.
> 
> To fix that, we use the host variant of the provider of the target
> variant of the virtual package to define the provider of the host variant
> of the virtual package (re-read it, it's correct!).
> 
> Fixes:
>     http://autobuild.buildroot.org/results/d8b/d8baf44b1e2f8e0e32c86558fc3e0694235b512a
>     http://autobuild.buildroot.org/results/59a/59ac0fe84e5c76a590c698a1483b2a3ae26e1dcf
>     http://autobuild.buildroot.org/results/203/2039f24731d8e14cde24c613b487b3db530dd238
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Julien Floret <julien.floret@6wind.com>
> ---
>  package/pkg-virtual.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
