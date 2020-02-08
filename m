From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 8 Feb 2020 17:13:49 +0100
Subject: [Buildroot] [PATCH 0/3] Riscv32 gcc bug 93532 workaround
In-Reply-To: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
References: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
Message-ID: <26d6a341-a746-e27a-194b-965e6cbda35e@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

this bug is shown only if riscv32 gcc is built with 
-fstack-protector-strong [1], so I don't know if it's better to disable 
SPP when building gcc for riscv32 version 8.x, or to keep -O0 workaround 
that is the same as Microblaze.

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93532

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 2/3/20 5:59 PM, Giulio Benetti wrote:
> Following Microblaze experience on gcc ICE and hangs let's treat the same
> way Riscv32 gcc bugs. So let's introduce gcc bug already reported and
> work around failing packages using -O0 optimization flash since no other
> workarounds worked(disable -g, trying -O1).
> 
> Giulio Benetti (3):
>    toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_93532
>    package/bullet: fix build failure due to gcc bug 93532
>    package/lmbench: fix build failure due to gcc bug 93532
> 
>   package/bullet/bullet.mk   | 2 +-
>   package/lmbench/lmbench.mk | 4 ++++
>   toolchain/Config.in        | 8 ++++++++
>   3 files changed, 13 insertions(+), 1 deletion(-)
> 
