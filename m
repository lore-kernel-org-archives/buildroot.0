From: Qais Yousef <qais.yousef@arm.com>
Date: Sun, 20 Dec 2020 01:47:16 +0000
Subject: [Buildroot] [PATCHv5 4/5] package/bpftrace: new package
In-Reply-To: <20201206173537.1397691-4-romain.naour@gmail.com>
References: <20201206173537.1397691-1-romain.naour@gmail.com>
 <20201206173537.1397691-4-romain.naour@gmail.com>
Message-ID: <20201220014716.qmk3sdnugkemgeqy@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/06/20 18:35, Romain Naour wrote:
> From: Qais Yousef <qais.yousef@arm.com>
> 
> bpftrace is a high-level tracing language for Linux enhanced Berkeley
> Packet Filter (eBPF) available in recent Linux kernels (4.x).
> 
> Only tested on x86_64 and aarch64. The package doesn't support i386 and
> aarch32.
> 
> Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
> v2: patch to build bundled libraries statically
>     Add glibc dependency
>     Rework to select bcc, libbpf and llvm RTII dependencies.
>     Add reverse dependencies
>     Add BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
>     Bump the version to the latest (upcoming 0.12)
>       due to many build issues (and patch to backport) with
>       the latest release.
>     Add binutils optional dependency to provide libbfd and libopcodes.
>     Disable manpages.
> ---

I don't think we need the dependency on libbpf? BCC provides it and we depend
on it.

Feel free to add my name to DEVELOPERS file too and your name too.

Beside the question on the addition of libbpf dependency, this looks good to
me.

Thanks for the rework!

Cheers

--
Qais Yousef
