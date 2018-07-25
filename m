From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 22:57:12 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix xtensa linker
 relaxation regression in 2.31.1
In-Reply-To: <20180723193753.15922-1-jcmvbkbc@gmail.com>
References: <20180723193753.15922-1-jcmvbkbc@gmail.com>
Message-ID: <20180725225712.61d8daaf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Jul 2018 12:37:53 -0700, Max Filippov wrote:
> Fix the following xtensa ld error observed when building uClibc-ng
> libthread_db with binutils-2.31:
> 
>   BFD (GNU Binutils) 2.31 internal error, aborting at
>   elf32-xtensa.c:3269 in elf_xtensa_finish_dynamic_sections
> 
> Fixes: https://gitlab.com/free-electrons/toolchains-builder/-/jobs/82264912
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...relaxation-of-undefined-weak-references-i.patch | 48 ++++++++++++
>  ...-dynamic-relocations-sections-consistency.patch | 90 ++++++++++++++++++++++
>  2 files changed, 138 insertions(+)
>  create mode 100644 package/binutils/2.31.1/0010-xtensa-fix-relaxation-of-undefined-weak-references-i.patch
>  create mode 100644 package/binutils/2.31.1/0011-xtensa-move-dynamic-relocations-sections-consistency.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
