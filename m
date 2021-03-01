From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Mar 2021 23:55:39 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/gstreamer1/gst1-plugins-bad: add sctp option
In-Reply-To: <20210227082522.194604-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 27 Feb 2021 09:25:22 +0100")
References: <20210227082522.194604-1-fontaine.fabrice@gmail.com>
Message-ID: <87tupulc0k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > sctp unconditionnally uses __sync_*_4 intrisics in
 > https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/blob/master/ext/sctp/usrsctp/usrsctplib/user_atomic.h

 > As a result, this will raise the following build failure with bootlin
 > sparc toolchain:

 > /srv/storage/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ext/sctp/usrsctp/libusrsctp-static.a(usrsctplib_user_socket.c.o): in function `usrsctp_conninput':
 > user_socket.c:(.text+0x3004): undefined reference to `__sync_fetch_and_add_4'

 > sctp uses an internal version of usrsctp (which is not available in
 > buildroot) and is available since version 1.15.1:
 > https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/e2f06326eac7c3c7fa9c0d5baf4bf9673fc93376

 > Fixes:
 >  - http://autobuild.buildroot.org/results/981b11ae9746d1eef40c1797398c4f6c16f005bd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Explicitly set sctp-internal-usrsctp option

Committed, thanks.

-- 
Bye, Peter Korsgaard
