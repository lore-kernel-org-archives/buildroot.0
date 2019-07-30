From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 30 Jul 2019 15:27:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/musl: bump to version 1.1.23
In-Reply-To: <20190730102331.25609-1-joerg.krause@embedded.rocks>
References: <20190730102331.25609-1-joerg.krause@embedded.rocks>
Message-ID: <6cd0ba64-c22a-3c36-cd0a-7edfc85e04c9@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/07/2019 11:23, J?rg Krause wrote:
> This version merges the RISC-V (64-bit) port and new math library
> implementations of log, exp, and pow. Internals of how (non-cancellable)
> syscalls are performed have been overhauled so that all code necessary to make
> the syscall resides in the arch-provided header and is inlinable. In the
> process, bugs in the implementation of mips and microblaze syscall mechanisms
> were found and fixed. Several other bugs were fixed as well, including a
> potentially serious one in the layout of static TLS for shared libraries on
> archs that use "TLS variant I" layout.
>
> A couple behaviors that were clearly undesirable but arguably mandated by POSIX
> have been fixed as a result of POSIX intepretations rendering them unnecessary.
>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/musl/musl.hash | 4 ++--
>  package/musl/musl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/musl/musl.hash b/package/musl/musl.hash
> index 5644401770..034393edd9 100644
> --- a/package/musl/musl.hash
> +++ b/package/musl/musl.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature from
> -# http://www.musl-libc.org/releases/musl-1.1.22.tar.gz.asc
> -sha256  8b0941a48d2f980fd7036cfbd24aa1d414f03d9a0652ecbd5ec5c7ff1bee29e3  musl-1.1.22.tar.gz
> +# http://www.musl-libc.org/releases/musl-1.1.23.tar.gz.asc
> +sha256  8a0feb41cef26c97dde382c014e68b9bb335c094bbc1356f6edaaf6b79bd14aa  musl-1.1.23.tar.gz
>  sha256  a3ae1b9fc5d4938f5734734383b9813d27a5652df23010c6f9d4c5419b239a41  COPYRIGHT
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 5db5bbd265..b401fb3d11 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MUSL_VERSION = 1.1.22
> +MUSL_VERSION = 1.1.23
>  MUSL_SITE = http://www.musl-libc.org/releases
>  MUSL_LICENSE = MIT
>  MUSL_LICENSE_FILES = COPYRIGHT

Successfully builds 'qemu_riscv64_virt_defconfig' and boots under qemu
3.1.0 to a working system.

Tested-by: Mark Corbin <mark.corbin@embecosm.com>

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
