From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 22:57:01 +0200
Subject: [Buildroot] [PATCHv2] pkg-infra: allow dumping reverse
 dependencies of a package
In-Reply-To: <1477236531-16771-1-git-send-email-yann.morin.1998@free.fr>
References: <1477236531-16771-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161025225701.5e28fae7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Oct 2016 17:28:51 +0200, Yann E. MORIN wrote:
> Finding the packages that select another one in a specific configuration
> is not very trivial:
> 
>   - when optional, the dependency is not expressed in Kconfig
> 
>   - looking at the .mk files is not very nice.
> 
> Introduce a way to dump reverse dependencies of packages, i.e. the list
> of packages that directly depend on that package. Like for direct
> dependencies, we limit the list to the first-order reverse dependencies.
> 
> Document it in the main help; use the opportunity to also document
> foo-show-depends.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v1 -> v2:
>   - only add dependencies for enabled packages  (Thomas)
>   - typoes  (Arnout)
> ---
>  Makefile               | 2 ++
>  package/pkg-generic.mk | 7 +++++++
>  2 files changed, 9 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
