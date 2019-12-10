From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 10 Dec 2019 14:09:29 -0800
Subject: [Buildroot] [PATCH 05/12] arch/arch.mk.xtensa: fix usage of
 arch-xtensa-overlay-extract
In-Reply-To: <20191210215952.902477-6-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
 <20191210215952.902477-6-thomas.petazzoni@bootlin.com>
Message-ID: <CAMo8BfJ+K64q0zL+Oq6suPv8JYB=nRdw=4u2=GCza=Tr-WnCyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 10, 2019 at 2:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> arch-xtensa-overlay-extract was used in gcc, linux, uboot, binutils
> and gdb without properly accouting for the package dependencies that
> may be needed to extract the overlay tarball.
>
> This commit fixes that by introducing an
> ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES variable in arch.mk.xtensa,
> and then use it where appropriate in gcc, linux, uboot, binutils and
> gdb.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Note: if this is preferred, we could avoid adding the
> ARCH_XTENSA_OVERLAY_EXTRACT_DEPENDENCIES variable, and directly call
> extractor-pkg-dependency from each of gcc, linux, uboot, binutils and
> gdb. Having an intermediate variable felt a bit simpler/cleaner, but I
> wouldn't mind changing it.
> ---
>  arch/arch.mk.xtensa                    | 2 ++
>  boot/uboot/uboot.mk                    | 1 +
>  linux/linux.mk                         | 1 +
>  package/binutils/binutils.mk           | 2 ++
>  package/gcc/gcc-final/gcc-final.mk     | 1 +
>  package/gcc/gcc-initial/gcc-initial.mk | 1 +
>  package/gdb/gdb.mk                     | 2 ++
>  7 files changed, 10 insertions(+)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
