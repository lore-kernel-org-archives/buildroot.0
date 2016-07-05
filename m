From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 16:00:44 +0200
Subject: [Buildroot] [PATCH 14/24 v2] core/pkg-generic: allow packages
 to declare target-finalize hooks
In-Reply-To: <464b6d13a2edac4d3fabbb9b712194c53987f1be.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <464b6d13a2edac4d3fabbb9b712194c53987f1be.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <20160705160044.60096a3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 21:07:36 +0200, Yann E. MORIN wrote:
> Currently, our skeleton declares target-finalize hooks, and does so
> unconditionally.
> 
> That's fine since we have a single skeleton package, and thus the hooks
> it declares need not be conditional.
> 
> However, we're going to be adding more skeleton packages, one for the
> custom skeleton, one for the sysv-like init systems and, eventually, one
> for the systemd init system.
> 
> In that case, we will not want the sysv-like target-finalize hooks to be
> applied when the init system is systemd. And the other way around, of
> course. And so on for each type of skeleton...
> 
> The only solution we have so far is to enclose all target-finalize hooks
> declarations between an ifeq-block to check that the package is enabled.
> This is cumbersome to do, even more so when the hooks are themselves
> conditional.
> 
> Add support in the core infra for packages to register such hooks, like
> is done to register users, device tables and whatnots.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  docs/manual/adding-packages-hooks.txt | 7 +++++++
>  package/pkg-generic.mk                | 2 ++
>  2 files changed, 9 insertions(+)

I've applied after rewriting the commit log. Indeed, I am not yet sure
we will have multiple skeleton packages, so the commit log from that
perspective may not be correct. However, the functionality itself is
useful on its own, for other packages, which is why I've applied it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
