From: usul27 <daniel@hifiberry.com>
Date: Fri, 22 May 2020 09:17:18 -0500 (CDT)
Subject: [Buildroot] COG crashes on Pi4 (wpe_webkit)
In-Reply-To: <1589958433571-0.post@n4.nabble.com>
References: <1589894180081-0.post@n4.nabble.com>
 <20200519194400.3edad316@gmx.net> <1589958433571-0.post@n4.nabble.com>
Message-ID: <1590157038870-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, finally got a build with debug symbols:

Thread 1 "cog" received signal SIGSEGV, Segmentation fault.
0x00000000 in ?? ()
(gdb) backtrace
#0  0x00000000 in ?? ()
#1  0xb1799f84 in ffi_call_SYSV () from /lib/libffi.so.7
#2  0xb17993fc in ffi_call_int () from /lib/libffi.so.7
#3  0xb1799b1c in ffi_call () from /lib/libffi.so.7
#4  0xb149b28c in wl_closure_invoke (closure=closure at entry=0xadb03a00,
flags=flags at entry=2, target=<optimized out>, opcode=3025639260,
data=<optimized out>, data at entry=0x74c60) at src/connection.c:1014
#5  0xb1497db0 in wl_client_connection_data (fd=<optimized out>,
mask=<optimized out>, data=0x74c60) at src/wayland-server.c:429
#6  0xb1499608 in wl_event_loop_dispatch (loop=0x5bfc8, timeout=<optimized
out>) at src/event-loop.c:640
#7  0xb0c59400 in WS::ServerSource::{lambda(_GSource*, int (*)(void*),
void*)#3}::_FUN(_GSource*, int (*)(void*), void*) () from
/lib/libWPEBackend-fdo-1.0.so.1
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

Somebody has any idea?




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
