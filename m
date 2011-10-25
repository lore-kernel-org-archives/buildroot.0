From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Oct 2011 08:27:17 +0200
Subject: [Buildroot] [PATCH 4/6] qemu_x86: update to kernel 3.1 and add
	readme
In-Reply-To: <1319485334-15790-4-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 24 Oct 2011 16:42:12 -0300")
References: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
 <1319485334-15790-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87aa8py4ai.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  .../x86/{linux-3.0.config => linux-3.1.config}     |    0
 Gustavo>  board/qemu/x86/readme.txt                          |    5 +++++
 Gustavo>  configs/qemu_x86_defconfig                         |    5 +++--
 Gustavo>  3 files changed, 8 insertions(+), 2 deletions(-)
 Gustavo>  rename board/qemu/x86/{linux-3.0.config => linux-3.1.config} (100%)
 Gustavo>  create mode 100644 board/qemu/x86/readme.txt

 Gustavo> diff --git a/board/qemu/x86/linux-3.0.config b/board/qemu/x86/linux-3.1.config
 Gustavo> similarity index 100%
 Gustavo> rename from board/qemu/x86/linux-3.0.config
 Gustavo> rename to board/qemu/x86/linux-3.1.config
 Gustavo> diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
 Gustavo> new file mode 100644
 Gustavo> index 0000000..c06d24f
 Gustavo> --- /dev/null
 Gustavo> +++ b/board/qemu/x86/readme.txt
 Gustavo> @@ -0,0 +1,5 @@
 Gustavo> +Run the emulation with:
 Gustavo> +
 Gustavo> +  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=ide -append root=/dev/sda

Why not qemu-system-i386? I would prefer to have console=ttyS0,115200 on
the cmdline as well.

 Gustavo> +
 Gustavo> +The login prompt will appear in the graphical window.

And then change this line.

 Gustavo> diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
 Gustavo> index d60b38d..8efe9ae 100644
 Gustavo> --- a/configs/qemu_x86_defconfig
 Gustavo> +++ b/configs/qemu_x86_defconfig
 Gustavo> @@ -4,6 +4,7 @@ BR2_x86_pentiumpro=y
 
 Gustavo>  # system
 Gustavo>  BR2_TARGET_GENERIC_GETTY=y
 Gustavo> +BR2_TARGET_GENERIC_GETTY_PORT="tty1"

Please keep it on ttyS0.

-- 
Bye, Peter Korsgaard
