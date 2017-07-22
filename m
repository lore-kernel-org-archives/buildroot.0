From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 15:41:21 +0200
Subject: [Buildroot] [PATCH 02/20] core/pkg-generic: add variable to
 skip skeleton dependency
In-Reply-To: <85a6c3a598a517fd0fad2cba0b7c42d746c7830e.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <85a6c3a598a517fd0fad2cba0b7c42d746c7830e.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <20170722154121.4a770035@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 19:25:28 +0200, Yann E. MORIN wrote:
> We currently skip the skeleton dependency by checking if the current
> package is the skeleton.
> 
> We are going to introduce more skeleton-related packages, so we
> need a way to exclude the skeleton dependency for those, or we'd
> get a circular dependency, for the same reason we need to skip
> the toolchain dependency.
> 
> Instead of checking for all the skeleton-providing packages in the core
> infra, add a new package options so that packages can express they do
> not need the dependency on the skeleton, like we have an option to avoid
> the depednency on the toolchain. The only packages that will use that
> option are probably the skeletons, so we need not document this
> variable, like we did not document the option to exclude the dependency
> on the toolchain.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/pkg-generic.mk       | 7 +++++--
>  package/skeleton/skeleton.mk | 1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
