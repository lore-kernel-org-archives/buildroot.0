From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 22:17:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/glibc: bump version for more
 post-2.28 fixes
In-Reply-To: <20190103200911.8779-1-mark.corbin@embecosm.com>
References: <20190103200911.8779-1-mark.corbin@embecosm.com>
Message-ID: <20190103221715.72646672@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Jan 2019 20:09:11 +0000, Mark Corbin wrote:
> This update includes two specific fixes that have been backported
> to the glibc 2.28 release branch from the glibc master branch:
> 
> 1) UAPI header file asm/syscalls.h has been merged into the UAPI
> asm/unistd.h header file for the RISC-V architecture in the
> 4.20 kernel. This causes the glibc 2.28 build to break.
> 
> 2) sysdeps/ieee754/soft-fp: ignore maybe-uninitialized with -O
> [BZ #19444]. The current patch for this issue can now be dropped
> from Buildroot.
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  ...soft-fp-ignore-maybe-uninitialized-w.patch | 88 -------------------
>  .../glibc.hash                                |  2 +-
>  package/glibc/glibc.mk                        |  2 +-
>  3 files changed, 2 insertions(+), 90 deletions(-)
>  delete mode 100644 package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
>  rename package/glibc/{glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa => glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1}/glibc.hash (69%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
