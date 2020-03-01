From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 17:52:15 +0100
Subject: [Buildroot] [PATCH 1/2] package/systemd: random-seed: add
 missing header for GRND_NONBLOCK
In-Reply-To: <20200301162647.438549-1-romain.naour@smile.fr>
References: <20200301162647.438549-1-romain.naour@smile.fr>
Message-ID: <20200301165215.GR8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-03-01 17:26 +0100, Romain Naour spake thusly:
> GRND_NONBLOCK has been introduced with the 3.17 kernel version [1]
> while adding getrandom(2) system call.
> 
> The header missing_random.h is needed for random-seed.c when building
> with old toolchain, such Sourcery CodeBench ARM 2014.05 (kernel headers
> 3.13).
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/454255917
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c6e9d6f38894798696f23c8084ca7edbf16ee895
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...add-missing-header-for-GRND_NONBLOCK.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/systemd/0001-random-seed-add-missing-header-for-GRND_NONBLOCK.patch
> 
> diff --git a/package/systemd/0001-random-seed-add-missing-header-for-GRND_NONBLOCK.patch b/package/systemd/0001-random-seed-add-missing-header-for-GRND_NONBLOCK.patch
> new file mode 100644
> index 0000000000..e74df10e9d
> --- /dev/null
> +++ b/package/systemd/0001-random-seed-add-missing-header-for-GRND_NONBLOCK.patch
> @@ -0,0 +1,39 @@
> +From 806e2011a0ea684b10a07b74c4ee0f817437e8c6 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@smile.fr>
> +Date: Sun, 1 Mar 2020 15:19:01 +0100
> +Subject: [PATCH] random-seed: add missing header for GRND_NONBLOCK
> +
> +GRND_NONBLOCK has been introduced with the 3.17 kernel version [1]
> +while adding getrandom(2) system call.
> +
> +The header missing_random.h is needed for random-seed.c when building
> +with old toolchain, such Sourcery CodeBench ARM 2014.05.
> +
> +Fixes:
> +https://gitlab.com/buildroot.org/buildroot/-/jobs/454255917
> +
> +[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c6e9d6f38894798696f23c8084ca7edbf16ee895
> +
> +Upstream status:
> +https://github.com/systemd/systemd/pull/14988
> +
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + src/random-seed/random-seed.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/random-seed/random-seed.c b/src/random-seed/random-seed.c
> +index 2fcbcb281a..596bff98f1 100644
> +--- a/src/random-seed/random-seed.c
> ++++ b/src/random-seed/random-seed.c
> +@@ -19,6 +19,7 @@
> + #include "io-util.h"
> + #include "log.h"
> + #include "main-func.h"
> ++#include "missing_random.h"
> + #include "missing_syscall.h"
> + #include "mkdir.h"
> + #include "parse-util.h"
> +-- 
> +2.24.1
> +
> -- 
> 2.24.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
