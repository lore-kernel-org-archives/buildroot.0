From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:16:55 +0100
Subject: [Buildroot] [PATCH 02/11] support/scripts/graph-depends: use
 proper rootpkg in remove_extra_deps()
In-Reply-To: <8730ab5253daddf6c5aaed9b4cc058e446faa624.1543741464.git.yann.morin.1998@free.fr>
References: <cover.1543741464.git.yann.morin.1998@free.fr>
 <8730ab5253daddf6c5aaed9b4cc058e446faa624.1543741464.git.yann.morin.1998@free.fr>
Message-ID: <20181206221655.1cfbaa78@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Dec 2018 10:04:34 +0100, Yann E. MORIN wrote:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> The remove_extra_deps() function removes dependencies that we are not
> interested in seeing in the dependency graph. It does this for all
> packages, except the 'all' package, which on full dependency graphs is
> the root of the tree.
> 
> However, this doesn't take into account package-specific dependency
> graphs (i.e make <pkg>-graph-depends) where the root is not 'all', but
> '<pkg>'. Due to this, dependencies on "mandatory deps" were not
> visible at all, i.e the toolchain package (and its dependencies) and
> the skeleton package (and its dependencies) were not displayed in
> package-specific dependency graphs.
> 
> To fix this, we use the existing rootpkg variable instead of
> hardcoding 'all'.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  support/scripts/graph-depends | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
