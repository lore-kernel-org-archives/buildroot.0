From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 8 Dec 2020 12:35:13 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH]
 toolchain/toolchain-buildroot: glibc 2.32 for ARC needs linux-headers >=
 5.1.0
In-Reply-To: <20201207224719.3603067-1-romain.naour@gmail.com>
References: <20201207224719.3603067-1-romain.naour@gmail.com>
Message-ID: <BN8PR12MB333049473066169F9B28DE3CA1CD0@BN8PR12MB3330.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

> From: Romain Naour <romain.naour@gmail.com>
> Sent: Tuesday, December 8, 2020 1:47 AM
> To: buildroot at buildroot.org <buildroot@buildroot.org>
> Cc: Romain Naour <romain.naour@gmail.com>; ARC Maintainers <arc-buildroot@synopsys.com>
> Subject: [arc-buildroot] [PATCH] toolchain/toolchain-buildroot: glibc 2.32 for ARC needs linux-headers >= 5.1.0 
> ?
> The ARC support has been merged into glibc 2.32 but it requires
> linux-headers >= 5.1.0 [1].
> 
> Fixes:
> https://gitlab.com/kubu93/toolchains-builder/-/jobs/895774971

Thanks for?taking care of this one!
 
> [1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=0be8ae3679570ff9a193615a035fc8074a8c704f
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: ARC Maintainers <arc-buildroot@synopsys.com>

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>

> ---
> ?toolchain/toolchain-buildroot/Config.in | 1 +
> ?1 file changed, 1 insertion(+)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 2058ff1eb9..ff9877ac24 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -56,6 +56,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
> ???????? depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
> ???????? depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
> ???????? depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
> +?????? depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
> ???????? depends on !BR2_powerpc_SPE
> ???????? depends on BR2_RISCV_ISA_RVA || !BR2_riscv
> ???????? select BR2_TOOLCHAIN_USES_GLIBC
> -- 
> 2.25.4
