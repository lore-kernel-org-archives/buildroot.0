From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 14:45:47 +0100
Subject: [Buildroot] [PATCH v9 01/32] package/expedite: move to package
 directory
In-Reply-To: <1449927215-3452-2-git-send-email-romain.naour@openwide.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
 <1449927215-3452-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151212144547.0143df16@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 12 Dec 2015 14:33:04 +0100, Romain Naour wrote:
> There is no advantage for efl related packages to share the same version
> number anymore (except for Efl and Elementary).
> 
> Here are the version number used for the 1.15 stable release:
> EFL                     1.15.2
> Elementary              1.15.2
> Emotion Generic Players 1.15.0
> Evas Generic Loaders    1.15.0
> Python-EFL              1.15.0
> 
> Also, we usually do not have a sub-directory for a family of related
> packages which don't share the same version number, so move expedite
> to the package directory. Expedite now appears in the
> "Graphic libraries and applications (graphic/text)" in the Kconfig menu.
> 
> In a followup patch, expedite will be downloaded directly from the 1.15
> branch in the git repository since there is no new tarball release after
> 1.7.0.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v5: fixes typos (ThomasP)
>     Use depends on BR2_PACKAGE_EFL instead of select (ThomasP)
> v4: improve the commit log (ThomasP)
>     move expedite to "Graphic applications" under
>     "Graphic libraries and applications" menu (ThomasP)
>     fix package comment dependency on BR2_USE_MMU
> ---
>  package/Config.in                      | 1 +
>  package/efl/Config.in                  | 1 -
>  package/{efl => }/expedite/Config.in   | 1 +
>  package/{efl => }/expedite/expedite.mk | 0
>  4 files changed, 2 insertions(+), 1 deletion(-)
>  rename package/{efl => }/expedite/Config.in (95%)
>  rename package/{efl => }/expedite/expedite.mk (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
