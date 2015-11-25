From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Wed, 25 Nov 2015 14:53:36 +0100
Subject: [Buildroot] BR2_ROOTFS_MERGED_USR and gdb
Message-ID: <CAMOMa6N-h2JaWhA96f2JE12Nq1i4aFC2p8t4LLDB1X44Txh3Rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Since the introduction of BR2_ROOTFS_MERGED_USR, /lib is now a symlink
to /usr/lib on the target. In the sysroot directory however, /lib and
/usr/lib are separate directories.

When remote debugging, this causes gdb to search only for libraries in
/lib under the sysroot directory.
Is there a way to fix this situation other than using "set solib-search-path"?

Thanks,
Pieterjan
