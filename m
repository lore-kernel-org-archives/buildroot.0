From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Feb 2013 20:32:02 +0000 (UTC)
Subject: [Buildroot] [Bug 5978] Erlang does not build for arm in 2013.02-rc3
In-Reply-To: <bug-5978-163@https.bugs.busybox.net/>
References: <bug-5978-163@https.bugs.busybox.net/>
Message-ID: <20130227203202.97A929ADCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5978

--- Comment #4 from Timofei Bolshakov <tbolsh@gmail.com> 2013-02-27 20:32:26 UTC ---
So, it looks like it does not have zlib in the host environment ...
I installed it on the host machine, but it does not help.
______________________________________________________________________________
bj/i686-pc-linux-gnu/opt/smp/erl_lock_check.o
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
obj/i686-pc-linux-gnu/opt/smp/erl_ao_firstfit_alloc.o
obj/i686-pc-linux-gnu/opt/smp/erl_thr_queue.o   
obj/i686-pc-linux-gnu/opt/smp/erl_sched_spec_pre_alloc.o
obj/i686-pc-linux-gnu/opt/smp/beam_emu.o       
obj/i686-pc-linux-gnu/opt/smp/beam_opcodes.o
obj/i686-pc-linux-gnu/opt/smp/beam_load.o       
obj/i686-pc-linux-gnu/opt/smp/beam_bif_load.o
obj/i686-pc-linux-gnu/opt/smp/beam_debug.o       
obj/i686-pc-linux-gnu/opt/smp/beam_bp.o
obj/i686-pc-linux-gnu/opt/smp/beam_catches.o
obj/i686-pc-linux-gnu/opt/smp/sys.o obj/i686-pc-linux-gnu/opt/smp/driver_tab.o
obj/i686-pc-linux-gnu/opt/smp/unix_efile.o obj/i686-pc-linux-gnu/opt/smp/gzio.o
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
obj/i686-pc-linux-gnu/opt/smp/ttsl_drv.o  -lutil -ldl -lm   -lncurses
-L../lib/internal/i686-pc-linux-gnu 
/root/buildroot-2013.02-rc3/output/build/host-erlang-R15B01/erts/emulator/zlib/obj/i686-pc-linux-gnu/opt/libz.a
/root/buildroot-2013.02-rc3/output/build/host-erlang-R15B01/erts/emulator/pcre/obj/i686-pc-linux-gnu/opt/libepcre.a
 -lethread -lerts_internal_r -lpthread  -lrt 
obj/i686-pc-linux-gnu/opt/smp/erl_bif_chksum.o: In function
`adler32_combine_3':
erl_bif_chksum.c:(.text+0x134): undefined reference to `adler32_combine64'
obj/i686-pc-linux-gnu/opt/smp/erl_bif_chksum.o: In function `crc32_combine_3':
erl_bif_chksum.c:(.text+0x20e): undefined reference to `crc32_combine64'
obj/i686-pc-linux-gnu/opt/smp/zlib_drv.o: In function `zlib_ctl':
zlib_drv.c:(.text+0x31c): undefined reference to `adler32_combine64'
zlib_drv.c:(.text+0x3e0): undefined reference to `crc32_combine64'
collect2: ld returned 1 exit status
make[4]: ***
[/root/buildroot-2013.02-rc3/output/build/host-erlang-R15B01/bin/i686-pc-linux-gnu/beam.smp]
Error 1
make[4]: Leaving directory
`/root/buildroot-2013.02-rc3/output/build/host-erlang-R15B01/erts/emulator'
make[3]: *** [opt] Error 2
make[3]: Leaving directory
`/root/buildroot-2013.02-rc3/output/build/host-erlang-R15B01/erts/emulator'
make[2]: *** [smp] Error 2
make[2]: Leaving directory
`/root/buildroot-2013.02-rc3/output/build/host-erlang-R15B01/erts'
make[1]: *** [emulator] Error 2
make[1]: Leaving directory
`/root/buildroot-2013.02-rc3/output/build/host-erlang-R15B01'
make: ***
[/root/buildroot-2013.02-rc3/output/build/host-erlang-R15B01/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
