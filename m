From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:24:56 +0100
Subject: [Buildroot] [PATCH] board/qemu/arm-vexpress-tz: fixup GDB
 config info
In-Reply-To: <df3197495e85234d914302b8de0f1b001b0e2c1b.1572355750.git.etienne.carriere@linaro.org>
References: <df3197495e85234d914302b8de0f1b001b0e2c1b.1572355750.git.etienne.carriere@linaro.org>
Message-ID: <06fc5979-a8c9-03fb-e5ab-f6036aa28625@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/10/2019 15:41, Etienne Carriere wrote:
> Fixes reference path "../build/optee_os-" to "./output/build/optee-os-"
> as package is optee-os and symbol file here is reached from BR top
> dir and assuming output in output/.
> 
> Updates GDB tool name to arm-linux-gdb.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  board/qemu/arm-vexpress-tz/readme.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
> index f058dbae4a..35ff018aec 100644
> --- a/board/qemu/arm-vexpress-tz/readme.txt
> +++ b/board/qemu/arm-vexpress-tz/readme.txt
> @@ -99,7 +99,7 @@ From a first shell:
>  	-S
>  
>  From a second shell:
> -  ./output/host/bin/arm-linux-gnueabihf-gdb
> +  ./output/host/bin/arm-linux-gdb
>    GNU gdb (GNU Toolchain for the A-profile Architecture 8.2-2018-08 (arm-rel-8.23)) 8.1.1.20180704-git
>    Copyright (C) 2018 Free Software Foundation, Inc.
>    ...
> @@ -111,7 +111,7 @@ From this GDB console, connect to the target, load the OP-TEE core symbols,
>  set a breakpoint to its entry point (__text_start) and start emulation:
>  
>    (gdb) target remote 127.0.0.1:1234
> -  (gdb) symbol-file ../build/optee_os-<reference>/out/arm/core/tee.elf
> +  (gdb) symbol-file ./output/build/optee-os-<reference>/out/arm/core/tee.elf
>    (gdb) hbreak __text_start
>    Hardware assisted breakpoint 1 at 0xe100000: file core/arch/arm/kernel/generic_entry_a32.S, line 246.
>    (gdb) cont
> 
