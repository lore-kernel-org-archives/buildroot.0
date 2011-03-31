From: bruce bushby <bruce.bushby@gmail.com>
Date: Thu, 31 Mar 2011 14:31:09 +0100
Subject: [Buildroot] Adding erlang to buildroot
Message-ID: <AANLkTimBSK1880rAkE39EqkxzB8_xRQDZmbQdRr5aicT@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I was wondering if anybody had previously tried to add "erlang" to
buildroot? .... or tried to adapt this guide:
http://www.avrfreaks.net/wiki/index.php/Documentation:AVR32_Linux_Development/How_to_build_an_embedded_Erlang



I started having a go using a very simple "erlang.mk" file (host only):

#############################################################
#
# erlang
#
#############################################################
ERLANG_VERSION = R14B02
ERLANG_SOURCE  = /otp_src_$(ERLANG_VERSION).tar.gz
ERLANG_SITE    = http://www.erlang.org/download/otp_src_R14B02.tar.gz

HOST_ERLANG_DEPENDENCIES = host-zlib
HOST_ERLANG_INSTALL_STAGING = YES

HOST_ERLANG_AUTORECONF = YES
HOST_ERLANG_LIBTOOL_PATCH = NO

#HOST_ERLANG_CONF_OPT += --enable-bootstrap-only

$(eval $(call AUTOTARGETS,package,erlang))
$(eval $(call AUTOTARGETS,package,erlang,host))




 .....but it fails with.......:

/usr/lib/ccache/gcc -o
/opt/buildroot/output/build/host-erlang-R14B02/bin/i686-pc-linux-gnu/beam.smp
\
 -L/opt/buildroot/output/host/lib -L/opt/buildroot/output/host/usr/lib
-Wl,-rpath,/opt/buildroot/output/host/usr/lib  -Wl,-export-dynamic
obj/i686-pc-linux-gnu/opt/smp/erl_main.o
 obj/i686-pc-linux-gnu/opt/smp/preload.o
obj/i686-pc-linux-gnu/opt/smp/erl_pbifs.o
 obj/i686-pc-linux-gnu/opt/smp/benchmark.o
obj/i686-pc-linux-gnu/opt/smp/erl_alloc.o
obj/i686-pc-linux-gnu/opt/smp/erl_mtrace.o
obj/i686-pc-linux-gnu/opt/smp/erl_alloc_util.o
obj/i686-pc-linux-gnu/opt/smp/erl_goodfit_alloc.o
obj/i686-pc-linux-gnu/opt/smp/erl_bestfit_alloc.o
 obj/i686-pc-linux-gnu/opt/smp/erl_afit_alloc.o
obj/i686-pc-linux-gnu/opt/smp/erl_instrument.o
obj/i686-pc-linux-gnu/opt/smp/erl_init.o
obj/i686-pc-linux-gnu/opt/smp/erl_atom_table.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_table.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_ddll.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_guard.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_info.o
 obj/i686-pc-linux-gnu/opt/smp/erl_bif_op.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_os.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_lists.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_trace.o
 obj/i686-pc-linux-gnu/opt/smp/erl_bif_wrap.o
obj/i686-pc-linux-gnu/opt/smp/erl_trace.o
 obj/i686-pc-linux-gnu/opt/smp/copy.o obj/i686-pc-linux-gnu/opt/smp/utils.o
            obj/i686-pc-linux-gnu/opt/smp/bif.o
obj/i686-pc-linux-gnu/opt/smp/io.o
 obj/i686-pc-linux-gnu/opt/smp/erl_printf_term.o
obj/i686-pc-linux-gnu/opt/smp/erl_debug.o
obj/i686-pc-linux-gnu/opt/smp/erl_md5.o
obj/i686-pc-linux-gnu/opt/smp/erl_message.o
 obj/i686-pc-linux-gnu/opt/smp/erl_process.o
obj/i686-pc-linux-gnu/opt/smp/erl_process_dict.o
 obj/i686-pc-linux-gnu/opt/smp/erl_process_lock.o
obj/i686-pc-linux-gnu/opt/smp/erl_port_task.o
 obj/i686-pc-linux-gnu/opt/smp/erl_arith.o
obj/i686-pc-linux-gnu/opt/smp/time.o
obj/i686-pc-linux-gnu/opt/smp/erl_time_sup.o
obj/i686-pc-linux-gnu/opt/smp/external.o
obj/i686-pc-linux-gnu/opt/smp/dist.o obj/i686-pc-linux-gnu/opt/smp/binary.o
            obj/i686-pc-linux-gnu/opt/smp/erl_db.o
obj/i686-pc-linux-gnu/opt/smp/erl_db_util.o
obj/i686-pc-linux-gnu/opt/smp/erl_db_hash.o
obj/i686-pc-linux-gnu/opt/smp/erl_db_tree.o
obj/i686-pc-linux-gnu/opt/smp/fix_alloc.o
obj/i686-pc-linux-gnu/opt/smp/big.o
obj/i686-pc-linux-gnu/opt/smp/hash.o obj/i686-pc-linux-gnu/opt/smp/index.o
            obj/i686-pc-linux-gnu/opt/smp/atom.o
obj/i686-pc-linux-gnu/opt/smp/module.o
obj/i686-pc-linux-gnu/opt/smp/export.o
obj/i686-pc-linux-gnu/opt/smp/register.o
obj/i686-pc-linux-gnu/opt/smp/break.o
obj/i686-pc-linux-gnu/opt/smp/erl_async.o
 obj/i686-pc-linux-gnu/opt/smp/erl_lock_check.o
obj/i686-pc-linux-gnu/opt/smp/erl_gc.o
obj/i686-pc-linux-gnu/opt/smp/erl_lock_count.o
obj/i686-pc-linux-gnu/opt/smp/erl_nmgc.o
 obj/i686-pc-linux-gnu/opt/smp/erl_posix_str.o
obj/i686-pc-linux-gnu/opt/smp/erl_bits.o
 obj/i686-pc-linux-gnu/opt/smp/erl_math.o
obj/i686-pc-linux-gnu/opt/smp/erl_fun.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_port.o
obj/i686-pc-linux-gnu/opt/smp/erl_term.o
obj/i686-pc-linux-gnu/opt/smp/erl_node_tables.o
obj/i686-pc-linux-gnu/opt/smp/erl_monitors.o
 obj/i686-pc-linux-gnu/opt/smp/erl_process_dump.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_timer.o
 obj/i686-pc-linux-gnu/opt/smp/erl_cpu_topology.o
obj/i686-pc-linux-gnu/opt/smp/erl_drv_thread.o
 obj/i686-pc-linux-gnu/opt/smp/erl_bif_chksum.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_re.o
obj/i686-pc-linux-gnu/opt/smp/erl_unicode.o
obj/i686-pc-linux-gnu/opt/smp/packet_parser.o
 obj/i686-pc-linux-gnu/opt/smp/safe_hash.o
obj/i686-pc-linux-gnu/opt/smp/erl_zlib.o
 obj/i686-pc-linux-gnu/opt/smp/erl_nif.o
obj/i686-pc-linux-gnu/opt/smp/erl_bif_binary.o
obj/i686-pc-linux-gnu/opt/smp/beam_emu.o
obj/i686-pc-linux-gnu/opt/smp/beam_opcodes.o
obj/i686-pc-linux-gnu/opt/smp/beam_load.o
obj/i686-pc-linux-gnu/opt/smp/beam_bif_load.o
obj/i686-pc-linux-gnu/opt/smp/beam_debug.o
 obj/i686-pc-linux-gnu/opt/smp/beam_bp.o
obj/i686-pc-linux-gnu/opt/smp/beam_catches.o
obj/i686-pc-linux-gnu/opt/smp/sys.o
obj/i686-pc-linux-gnu/opt/smp/driver_tab.o
obj/i686-pc-linux-gnu/opt/smp/unix_efile.o
obj/i686-pc-linux-gnu/opt/smp/gzio.o
obj/i686-pc-linux-gnu/opt/smp/elib_memmove.o
obj/i686-pc-linux-gnu/opt/smp/sys_float.o
obj/i686-pc-linux-gnu/opt/smp/sys_time.o
obj/i686-pc-linux-gnu/opt/smp/erl_poll.kp.o
obj/i686-pc-linux-gnu/opt/smp/erl_check_io.kp.o
obj/i686-pc-linux-gnu/opt/smp/erl_poll.nkp.o
obj/i686-pc-linux-gnu/opt/smp/erl_check_io.nkp.o
obj/i686-pc-linux-gnu/opt/smp/erl_mseg.o
obj/i686-pc-linux-gnu/opt/smp/erl_unix_sys_ddll.o
obj/i686-pc-linux-gnu/opt/smp/erl_mtrace_sys_wrap.o
obj/i686-pc-linux-gnu/opt/smp/erl_sys_common_misc.o
obj/i686-pc-linux-gnu/opt/smp/hipe_bif0.o
obj/i686-pc-linux-gnu/opt/smp/hipe_bif1.o
obj/i686-pc-linux-gnu/opt/smp/hipe_bif2.o
obj/i686-pc-linux-gnu/opt/smp/hipe_debug.o
obj/i686-pc-linux-gnu/opt/smp/hipe_gc.o
obj/i686-pc-linux-gnu/opt/smp/hipe_mode_switch.o
obj/i686-pc-linux-gnu/opt/smp/hipe_native_bif.o
obj/i686-pc-linux-gnu/opt/smp/hipe_stack.o
obj/i686-pc-linux-gnu/opt/smp/hipe_x86.o
obj/i686-pc-linux-gnu/opt/smp/hipe_x86_glue.o
obj/i686-pc-linux-gnu/opt/smp/hipe_x86_bifs.o
obj/i686-pc-linux-gnu/opt/smp/hipe_x86_signal.o
obj/i686-pc-linux-gnu/opt/smp/hipe_x86_stack.o
 obj/i686-pc-linux-gnu/opt/smp/efile_drv.o
obj/i686-pc-linux-gnu/opt/smp/inet_drv.o
obj/i686-pc-linux-gnu/opt/smp/zlib_drv.o
obj/i686-pc-linux-gnu/opt/smp/ram_file_drv.o
obj/i686-pc-linux-gnu/opt/smp/ttsl_drv.o -lutil -ldl -lm   -lncurses
-L../lib/internal/i686-pc-linux-gnu
 /opt/buildroot/output/build/host-erlang-R14B02/erts/emulator/zlib/obj/i686-pc-linux-gnu/opt/libz.a
/opt/buildroot/output/build/host-erlang-R14B02/erts/emulator/pcre/obj/i686-pc-linux-gnu/opt/libepcre.a
 -lethread -lerts_internal_r -lpthread  -lrt
obj/i686-pc-linux-gnu/opt/smp/erl_bif_chksum.o: In function
`crc32_combine_3':
erl_bif_chksum.c:(.text+0xf98): undefined reference to `crc32_combine64'
obj/i686-pc-linux-gnu/opt/smp/erl_bif_chksum.o: In function
`adler32_combine_3':
erl_bif_chksum.c:(.text+0x1310): undefined reference to `adler32_combine64'
obj/i686-pc-linux-gnu/opt/smp/zlib_drv.o: In function `zlib_ctl':
zlib_drv.c:(.text+0x43c): undefined reference to `adler32_combine64'
zlib_drv.c:(.text+0x4d8): undefined reference to `crc32_combine64'
collect2: ld returned 1 exit status
make[4]: ***
[/opt/buildroot/output/build/host-erlang-R14B02/bin/i686-pc-linux-gnu/beam.smp]
Error 1
make[4]: Leaving directory
`/opt/buildroot/output/build/host-erlang-R14B02/erts/emulator'
make[3]: *** [opt] Error 2
make[3]: Leaving directory
`/opt/buildroot/output/build/host-erlang-R14B02/erts/emulator'
make[2]: *** [smp] Error 2
make[2]: Leaving directory
`/opt/buildroot/output/build/host-erlang-R14B02/erts'
make[1]: *** [emulator] Error 2
make[1]: *** Waiting for unfinished jobs....



If I manually "tar-extract" and configure/make ... then erlang builds ok in
/tmp on the same machine....I have been wondering if it's my "host-only" mk
file that is causing problems?


Any hints would be much appreciated!

Bruce
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110331/5ade3cd8/attachment-0001.html>
