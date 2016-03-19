From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 16:29:11 +0100
Subject: [Buildroot] [PATCH 14/16 v5] core/legal-info: allow ignoring
 packages from the legal-info
In-Reply-To: <96aee606d5d79d7867fc7d60c5343e0b827ff795.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <96aee606d5d79d7867fc7d60c5343e0b827ff795.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <20160319162911.611fa561@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 11 Mar 2016 18:49:27 +0100, Yann E. MORIN wrote:
> It might be necessary to not even mention a package in the output of
> legal-info:
> 
>   - virtual packages have virtually nothing to save in the legal-info
>     output;
> 
>   - for Buildroot itself, host-gcc-initial and host-gcc-final are
>     not real packages, they are just two different steps of the same
>     package, gcc;
> 
>   - for proprietary packages, it might not even be legal to even
>     mention them, being under NDA or some other such restrictive
>     conditions.

What is the difference with <pkg>_REDISTRIBUTE = NO ? I know
REDISTRIBUTE = NO packages are mentioned in legal-info, but their
source code is not copied to the legal-info stuff.

But does it make sense to have two separate things? Why do REDISTRIBUTE
= NO packages get mentioned in the legal-info if their source code is
anyway not saved.

> Introduce the new FOO_LEGAL_INGORE variable that a package can set

typoe: IGNORE

> to 'YES' (default to 'NO') to indicate that the package should be
> completely ignored from the legal-info output, in which case the
> package is not mentioned in the maniufest, its source archive,

typo: manifest

> patches and license files are not saved into legal-info/ .
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v1 -> v2:
>   - introduce a new variable, instead of making _REDISTRIBUTE a
>     tri-state  (Thomas, Peter, Luca)

Ah, we discussed using REDISTRIBUTE, I remember. But do we need a
tri-state ? Do we really have REDISTRIBUTE = NO packages that we want
to see mentioned in the legal-info output ?

> +* +LIBFOO_LEGAL_IGNORE+ can be set to +YES+ or +NO+ (the default) to indicate

To me, the naming of the variable looks like inverted logic. What about:

LIBFOO_SAVE_LEGAL_INFO = YES (default) / NO

but obviously, <pkg>_SAVE_LEGAL_INFO is a bit confusing with
<pkg>_REDISTRIBUTE.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
