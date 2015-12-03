From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 3 Dec 2015 18:19:46 +0100
Subject: [Buildroot] [PATCH 13/51] core/legal-info: also save patches
In-Reply-To: <1eb83a36a7550616342ee9c69059059b111f3f78.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <1eb83a36a7550616342ee9c69059059b111f3f78.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <566079B2.9040905@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
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
> _LICENSE_FILES (however, we need not extract and patch a package if it
> is set to be ignored for redistribution).
>
> Update the legal-info header accordingly.
>
> Note: this means that, when a (non-ignored) package is not patched and
> defines no LICENSE_FILES, we will extract and patch it for nothing.
> There is no easy way to know whether we have to patch a package or not.
> We can only either duplicate the logic to detect patches (bad) or rely
> on the infra actually patching the package.  Also, a vast majority of
> packages are either patched, or define _LICENSE_FILES, so it is best and
> easiest to always extract and patch them prior to legal-info.

Anything else would be more complex and give little advantage. Ideally
we should have _LICENSE_FILES defined for nearly all packages, after
all.

So:

Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
