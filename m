From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:29:54 +0200
Subject: [Buildroot] [PATCH v8] openblas: new package
In-Reply-To: <1467017090-582-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467017090-582-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160701162954.43c8da69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Jun 2016 09:44:50 +0100, Vicente Olivert Riera wrote:
> OpenBLAS is optimised for specific CPU models, which don't fully match
> with the GCC code generation options. Therefore, we can't automatically
> select BR2_PACKAGE_OPENBLAS_TARGET based on the CPU choice. Instead, let
> the user select the TARGET name, but offer a sensible default. Other
> possible solutions were deemed too complicated: adding choice options in
> the ambiguous cases, or only making the option user-visible when there
> is ambiguity.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v7 -> v8:
>  - Rename BR2_PACKAGE_OPENBLAS_TARGET to BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
>    and make it a blind option. Make BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>    depend on BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET != "", this way the package
>    will not be available for architectures which don't have any matching
>    OpenBLAS target. This will avoid future build failures. Finally add
>    BR2_PACKAGE_OPENBLAS_TARGET option, which will depend on the package
>    being selected, to let the user change the default OpenBLAS target. (Arnout)
>  - Initialise OpenBLAS make options to TARGET_CONFIGURE_OPTS. This way
>    TARGET_CONFIGURE_OPTS is also used in the install phases. (Arnout)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
