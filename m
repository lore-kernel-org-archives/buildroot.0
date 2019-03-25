From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:36:03 +0100
Subject: [Buildroot] [PATCH 2/3 v3] support/graph-depends: don't
 eliminate mandatory deps for reverse graphs
In-Reply-To: <e80973941296758686f7129ecf12d6bee9037c4e.1553288807.git.yann.morin.1998@free.fr>
References: <cover.1553288807.git.yann.morin.1998@free.fr>
 <e80973941296758686f7129ecf12d6bee9037c4e.1553288807.git.yann.morin.1998@free.fr>
Message-ID: <20190325193603.29f39824@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Mar 2019 22:07:06 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> We we simplify the dependency graph, we try to remove so-called
> mandatory dependencies from each package, and for each mandatory that
> was thus removed, reattach it to the root-package of the graph.
> 
> This was made so that mandatory dependencies (which are dependencies of
> all packages, or at least of a lot of packages) do not clutter the
> dependency graph, but that they are still shown in the graph, as
> dependencies of the root package.
> 
> However, these mandatory dependencies are only _direct_ dependencies.
> As such, it does not make sense to reattach a mandatory dependency when
> doing a reverse graph. Worse, it can actually be incorrect.
> 
> For example, 'skeleton' is a mandatory dependency, and as such is
> removed from all packages. But when doing a reverse graph, skeleton is
> now in the dependency chain of, e.g. skeleton-init-none; it should then
> not be removed.
> 
> In short: the notion of mandatory dependencies does not make sense in
> the case of a reverse graph.
> 
> Consequently, skip over the mandatory dependency removal when doing a
> reverse graph.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/graph-depends | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
