From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:37:26 +0100
Subject: [Buildroot] [PATCH] boot/grub: fix grub-mkimage with binutils
 >= 2.31
In-Reply-To: <1544694457-13704-1-git-send-email-romain.naour@smile.fr>
References: <1544694457-13704-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20181213213726.124fd185@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Dec 2018 10:47:37 +0100, Romain Naour wrote:
> While using pc_x86_64_efi_defconfig with a bleeding-edge x86_64 toolchain
> based on binutils 2.31, the grub-mkimage command return this error:
> 
> grub-mkimage: error: relocation 0x4 is not implemented yet.
> 
> Backport an upstream patch [1] as suggested on openembedded mailing list [2].
> 
> [1] http://git.savannah.gnu.org/cgit/grub.git/commit/?id=842c390469e2c2e10b5aa36700324cd3bde25875
> [2] http://lists.openembedded.org/pipermail/openembedded-core/2018-July/153054.html
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  ...-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 boot/grub2/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
