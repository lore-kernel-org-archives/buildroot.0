From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 09:19:03 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gnu-efi: fix efilink for
 systemd-boot
In-Reply-To: <20191025212816.68218-1-james.hilliard1@gmail.com>
References: <20191025212816.68218-1-james.hilliard1@gmail.com>
Message-ID: <20191026091903.79181e2d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Oct 2019 15:28:16 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This fixes a compilation error when building with systemd with systemd-boot
> enabled.
> 
> Fixes:
> >>> systemd 241 Building  
> PATH="/home/buildroot/buildroot/output/host/bin:/home/buildroot/buildroot/output/host/sbin:/home/buildroot/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" LC_ALL=en_US.UTF-8 PYTHONNOUSERSITE=y /home/buildroot/buildroot/output/host/bin/ninja  -j33  -C /home/buildroot/buildroot/output/build/systemd-241//build
> ninja: Entering directory `/home/buildroot/buildroot/output/build/systemd-241//build'
> [458/805] Generating disk.c.o with a custom command.
> FAILED: src/boot/efi/disk.c.o
> /home/buildroot/buildroot/output/host/bin/i686-buildroot-linux-gnu-gcc -c ../src/boot/efi/disk.c -o src/boot/efi/disk.c.o -Wall -Wextra -std=gnu90 -nostdinc -ggdb -O0 -fpic -fshort-wchar -ffreestanding -fno-strict-aliasing -fno-stack-protector -Wsign-compare -Wno-missing-field-initializers -isystem /home/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/sysroot/usr/include/efi -isystem /home/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/sysroot/usr/include/efi/ia32 -include src/boot/efi/efi_config.h -include version.h
> In file included from /home/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/sysroot/usr/include/efi/efilib.h:25,
>                  from ../src/boot/efi/disk.c:4:
> /home/buildroot/buildroot/output/host/i686-buildroot-linux-gnu/sysroot/usr/include/efi/efilink.h:5:10: fatal error: stdint.h: No such file or directory
>  #include <stdint.h>
>           ^~~~~~~~~~
> compilation terminated.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...evert-efilink-fix-build-with-gcc-4.8.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/gnu-efi/0002-Revert-efilink-fix-build-with-gcc-4.8.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
