From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Sep 2018 01:00:51 +0200
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <20180831091154.22530-1-mark.corbin@embecosm.com>
References: <20180831091154.22530-1-mark.corbin@embecosm.com>
Message-ID: <804d638c-2b7c-1a12-894f-fa79094d2456@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/08/2018 11:11, Mark Corbin wrote:
> This enables a riscv64 system to be built with a Buildroot generated
> toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).
> 
> This configuration has been used to successfully build a qemu-bootable
> riscv-linux-4.15 kernel (https://github.com/riscv/riscv-linux.git).
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  Makefile                                |   1 +
>  arch/Config.in                          |  15 ++++
>  arch/Config.in.riscv                    | 104 ++++++++++++++++++++++++
>  arch/arch.mk.riscv                      |  24 ++++++
>  package/binutils/Config.in.host         |   3 +
>  toolchain/toolchain-buildroot/Config.in |  12 ++-

 One more thing that is missing: in package/linux-headers/Config.in.host, you
have to exclude all the linux versions that don't support riscv yet (i.e.
everything before 4.15).

 To simplify that job, you first might want (in separate patches) some
deprecated versions: 4.10, 4.11, 4.12, 4.13.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
