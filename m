From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 3 Nov 2020 00:52:52 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/wireshark: bump to version 3.4.0
In-Reply-To: <20201102195737.81319-1-fontaine.fabrice@gmail.com>
References: <20201102195737.81319-1-fontaine.fabrice@gmail.com>
Message-ID: <20201102235252.GA26078@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> - c-ares is mandatory since
>   https://github.com/wireshark/wireshark/commit/451a241e50bd34ba097bd09a5f9f673170779aaf
> - Disable ilibc which is available and enabled by default since
>   https://github.com/wireshark/wireshark/commit/12a13a69264fdef4281e4b13c8c7d92a272cc99e
> - LTO can be enabled since
>   https://github.com/wireshark/wireshark/commit/e6b5bd09766a1320c5540f78eb0e4ba03ce8f108
> - opus is an optional dependency since
>   https://github.com/wireshark/wireshark/commit/6136c719da4ec9b96c01adb4b0fd7f01af171688

> https://www.wireshark.org/docs/relnotes/wireshark-3.4.0.html

> ---
> Changes v1 -> v2 (after review of Petr Vorel):
>  - c-ares is now mandatory
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Petr Vorel <petr.vorel@gmail.com>

I also found some problems with br-powerpc-e500mc-full

[ 92%] Linking C shared library ../run/libwireshark.so
br-test-pkg/br-powerpc-e500mc-full/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/8.3.0/crtbeginS.o: in function `__do_global_dtors_aux':
crtstuff.c:(.text+0x168): relocation truncated to fit: R_PPC_PLTREL24 against symbol `__cxa_finalize' defined in .text section in br-test-pkg/br-powerpc-e500mc-full/host/powerpc-buildroot-linux-uclibc/sysroot/lib/libc.so.1
CMakeFiles/epan.dir/addr_and_mask.c.o: in function `ip_get_subnet_mask':
addr_and_mask.c:(.text+0x44): relocation truncated to fit: R_PPC_PLTREL24 against symbol `g_assertion_message_expr' defined in .text section in br-test-pkg/br-powerpc-e500mc-full/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libglib-2.0.so
CMakeFiles/epan.dir/addr_and_mask.c.o: in function `tvb_get_ipv4_addr_with_prefix_len':
addr_and_mask.c:(.text+0xa0): relocation truncated to fit: R_PPC_PLTREL24 against symbol `tvb_memcpy' defined in .text section in CMakeFiles/epan.dir/tvbuff.c.o
CMakeFiles/epan.dir/addr_and_mask.c.o: in function `tvb_get_ipv6_addr_with_prefix_len':
addr_and_mask.c:(.text+0x118): relocation truncated to fit: R_PPC_PLTREL24 against symbol `memset' defined in .text section in br-test-pkg/br-powerpc-e500mc-full/host/powerpc-buildroot-linux-uclibc/sysroot/lib/libc.so.1
addr_and_mask.c:(.text+0x12c): relocation truncated to fit: R_PPC_PLTREL24 against symbol `tvb_memcpy' defined in .text section in CMakeFiles/epan.dir/tvbuff.c.o
CMakeFiles/epan.dir/addr_resolv.c.o: in function `ipv6_equal':
addr_resolv.c:(.text+0x5c): relocation truncated to fit: R_PPC_PLTREL24 against symbol `memcmp' defined in .text section in br-test-pkg/br-powerpc-e500mc-full/host/powerpc-buildroot-linux-uclibc/sysroot/lib/libc.so.1
CMakeFiles/epan.dir/addr_resolv.c.o: in function `eth_addr_cmp':
addr_resolv.c:(.text+0x88): relocation truncated to fit: R_PPC_PLTREL24 against symbol `memcmp' defined in .text section in br-test-pkg/br-powerpc-e500mc-full/host/powerpc-buildroot-linux-uclibc/sysroot/lib/libc.so.1
CMakeFiles/epan.dir/addr_resolv.c.o: in function `_serv_name_lookup':
addr_resolv.c:(.text+0xd8): relocation truncated to fit: R_PPC_PLTREL24 against symbol `wmem_map_lookup' defined in .text section in wmem/CMakeFiles/wmem.dir/wmem_map.c.o
CMakeFiles/epan.dir/addr_resolv.c.o: in function `wka_name_lookup':
addr_resolv.c:(.text+0x1dc): relocation truncated to fit: R_PPC_PLTREL24 against symbol `wmem_map_lookup' defined in .text section in wmem/CMakeFiles/wmem.dir/wmem_map.c.o
CMakeFiles/epan.dir/addr_resolv.c.o: in function `end_ethent':
addr_resolv.c:(.text+0x240): relocation truncated to fit: R_PPC_PLTREL24 against symbol `fclose' defined in .text section in br-test-pkg/br-powerpc-e500mc-full/host/powerpc-buildroot-linux-uclibc/sysroot/lib/libc.so.1
CMakeFiles/epan.dir/addr_resolv.c.o: in function `end_ipxnetent':
addr_resolv.c:(.text+0x288): additional relocation overflows omitted from the output
collect2: error: ld returned 1 exit status

+ now common problems with br-riscv32 discussed in:
https://patchwork.ozlabs.org/project/buildroot/patch/20201101180154.14307-1-petr.vorel at gmail.com/#2566327

Kind regards,
Petr
