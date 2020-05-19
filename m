From: usul27 <daniel@hifiberry.com>
Date: Tue, 19 May 2020 08:16:20 -0500 (CDT)
Subject: [Buildroot] COG crashes on Pi4 (wpe_webkit)
Message-ID: <1589894180081-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using the latest release candidate on the Raspberry Pi 3 and 4. While the
Pi3 version works well, the wpe_webkit browser crashes. I don't have a
version with debug symbols running, but maybe somebody have seen this
already and has some hint:

(gdb) backtrace
#0  0x00000000 in ?? ()
#1  0xb26382cc in ?? () from /lib/libffi.so.7
#2  0xb2637c94 in ?? () from /lib/libffi.so.7
#3  0xb2637f24 in ffi_call () from /lib/libffi.so.7
#4  0xb2380c30 in ?? () from /lib/libwayland-server.so.0
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

Weston is using the DRM backend:
/usr/bin/weston --backend=drm-backend.so --modules=systemd-notify.so





--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
