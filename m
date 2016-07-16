From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 15:09:20 +0200
Subject: [Buildroot] [PATCH] package/rt-tests: disable for too old
 toolchains
In-Reply-To: <1468674097-30468-1-git-send-email-romain.naour@gmail.com>
References: <1468674097-30468-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160716150920.0c011e72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 15:01:37 +0200, Romain Naour wrote:
> rt-tests doesn't build with some "old" toolchains due to missing local
> syscall number definition for the new kernel deadline scheduler on some
> architectures. Upsteam added __NR_sched_setattr and __NR_sched_setattr
> definition only for common architectures (x86, x86_64, arm) and tile if
> not already defined [1].
> 
> Instead of adding missing syscall number, avoid building rt-tests
> with toolchain compiled with too old kernel headers (i.e
> !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14)
> 
> At runtime, a 3.14 kernel must be used otherwise these syscall are not
> available.
> 
> [1]
> https://kernel.googlesource.com/pub/scm/utils/rt-tests/rt-tests.git/+/ef2dee4232b7cae594ef7ecb7230c4bd18cea3f3
> 
> Fixes:
> http://autobuild.buildroot.net/results/6fa/6facaeb10588bdf3ff029b882a8ae6ffba815cdc
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/rt-tests/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
