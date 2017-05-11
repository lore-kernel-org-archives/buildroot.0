From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:47:04 +0200
Subject: [Buildroot] [PATCH v3 next] flex: bump version to 2.6.4
In-Reply-To: <20170510135139.30976-1-Vincent.Riera@imgtec.com>
References: <20170510135139.30976-1-Vincent.Riera@imgtec.com>
Message-ID: <20170511214704.273495a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 May 2017 14:51:39 +0100, Vicente Olivert Riera wrote:
> - 0001 patch removed. It doesn't apply on this version and is also not
>   necessary since the AR binary is now handled correctly with AR = @AR at .
> - 0002 patch removed. It's already included in this release:
>   https://github.com/westes/flex/commit/a5cbe929ac3255d371e698f62dc256afe7006466
> - The flex project has moved to GitHub, so modify the URLs in both
>   flex.mk and Config.in files.
> - The sed command over Makefile.in to prevent the flex binary to be
>   built fails, so remove it. That logic has been moved to
>   src/Makefile.in, and whenever we disable the flex binary to be built
>   then the compilation fails when building the documentation because
>   some bits require "../src/flex", which is the flex binary.
>   We prevent building the flex binary and the documentation using a new
>   patch.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v2 -> v3:
>  - Add a new patch to prevent the flex binary and the documentation to
>    be built.
>  - Restore the hook for removing the broken flex++ symlink.
> Changes v1 -> v2:
>  - Do not offer the possibility to decide if we want the flex binary
>    installed on the target. Instead of that, remove it unconditionally.
> ---
>  ...lex-disable-flex-binary-and-documentation.patch | 35 ++++++++++++++++++++++
>  package/flex/0001-prog-ar.patch                    | 11 -------
>  package/flex/0002-fix-CVE-2016-6354.patch          | 25 ----------------
>  package/flex/Config.in                             |  2 +-
>  package/flex/flex.hash                             |  2 +-
>  package/flex/flex.mk                               |  9 ++----
>  6 files changed, 39 insertions(+), 45 deletions(-)
>  create mode 100644 package/flex/0001-flex-disable-flex-binary-and-documentation.patch
>  delete mode 100644 package/flex/0001-prog-ar.patch
>  delete mode 100644 package/flex/0002-fix-CVE-2016-6354.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
