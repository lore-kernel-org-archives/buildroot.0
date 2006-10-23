From: Itzhak Ben-Akiva <itzhakba@aeronautics-sys.com>
Date: Mon, 23 Oct 2006 10:41:52 +0200
Subject: [Buildroot] Buildroot for PowerPC
Message-ID: <1161592912.5391.5.camel@benakiva-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm compiling buildroot (snapshot 22-Oct-2006) with the toolchain option
of gcc-4.1.1 binutils-2.17 and linux kernel header 2.6.18. The
compilation of the toolchain went without problem. However, when I get
to the compilation of busybox (snapshot 22-Oct-2006) it stops because a
missing file Rules.mak as we can see below. I see that the file
Rules.mak exists in busybox-1.2. Is it really a missing file problem or
a problem in the configuration? I mean, should buildroot really be
trying to edit (sed) this file?

bzcat /usr/local/buildroot/dl/busybox-snapshot.tar.bz2 | tar
-C /usr/local/buildroot/build_powerpc   -xf -
# if we have external syslogd, force busybox to use it
/usr/local/buildroot/toolchain_build_powerpc/bin/sed -i -e
"/#include.*busybox\.h/a#define
CONFIG_SYSLOGD" /usr/local/buildroot/build_powerpc/busybox/init/init.c
# Allow busybox patches.
toolchain/patch-kernel.sh /usr/local/buildroot/build_powerpc/busybox
package/busybox busybox\*.patch
touch /usr/local/buildroot/build_powerpc/busybox/.unpacked
cp
package/busybox/busybox.config /usr/local/buildroot/build_powerpc/busybox/.config
/usr/local/buildroot/toolchain_build_powerpc/bin/sed -i -e
"s,^CROSS.*,CROSS=/usr/local/buildroot/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-\n\

PREFIX=/usr/local/buildroot/build_powerpc/root,;" /usr/local/buildroot/build_powerpc/busybox/Rules.mak
/usr/local/buildroot/toolchain_build_powerpc/bin/sed: can't
read /usr/local/buildroot/build_powerpc/busybox/Rules.mak: No such file
or directory

Thanks,
Itzhak
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061023/cfce5177/attachment.htm 
