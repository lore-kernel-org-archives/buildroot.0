From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 14:05:46 +0200
Subject: [Buildroot] [PATCH] package/gcc: nios2 Backport nios2 r31 fix
In-Reply-To: <1475934412-29919-1-git-send-email-romain.naour@gmail.com>
References: <1475934412-29919-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161009140546.223f5049@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Oct 2016 15:46:52 +0200, Romain Naour wrote:
> As reported on the mailing list, gcc5 with binutils 2.26.1 produce some
> assembler error "r31 cannot be used with jmp; use ret instead" [1]
> 
> The bug is reported upstream [2], but gcc 5.4 needs an upstream patch to
> fix this issue.
> 
> Note: openembedded backported the same patch for gcc 5.3 [3]
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-September/172932.html
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=20674
> [3] http://lists.openembedded.org/pipermail/openembedded-core/2016-February/117633.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../5.4.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch   | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 package/gcc/5.4.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch

Applied to master after adding the references to the autobuilder
failures.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
