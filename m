From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 16:22:01 +0200
Subject: [Buildroot] [PATCH 08/13 v7] core/legal-info: also save patches
In-Reply-To: <d280d1c64b43031e31feef82091e5bb59ba43d86.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <d280d1c64b43031e31feef82091e5bb59ba43d86.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <20160624162201.5e10d065@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 18:14:33 +0200, Yann E. MORIN wrote:
> Currently, the legal-info infra only saves the source archive of a
> package. However, that's not enough as we may apply some patches on
> packages sources.
> 
> We do suggest users to also redistribute the Buildroot sources as part
> of their compliance distribution, so the patches bundled in Buildroot
> would indeed be included in the compliance distribution.
> 
> However, that's still not enough, since we may download some patches, or
> the user may use a global patch directory. Patches in there might not
> end up in the compliance distribution, and there are risks of
> non-conformity.
> 
> So, always include patches alongside the source archive.
> 
> To ensure reproducibility, we also generate a series file, so patches
> can be re-applied in the correct order.
> 
> We get the list of patches to include from the list of patches that were
> applied by the package infrastructure (via the apply-patches support
> script). So, we need to get packages properly extracted and patched
> before we can save their legal-info, not just in the case they define
> _LICENSE_FILES.
> 
> Update the legal-info header accordingly.
> 
> Note: this means that, when a package is not patched and defines no
> LICENSE_FILES, we will extract and patch it for nothing. There is no
> easy way to know whether we have to patch a package or not. We can only
> either duplicate the logic to detect patches (bad) or rely on the infra
> actually patching the package. Also, a vast majority of packages are
> either patched, or define _LICENSE_FILES, so it is best and easiest to
> always extract and patch them prior to legal-info.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v6 -> v7:
>   - directly call the helper

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
