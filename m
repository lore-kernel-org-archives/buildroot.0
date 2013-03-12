From: Roland Uuesoo <rolandu@gmail.com>
Date: Tue, 12 Mar 2013 11:37:43 +0200
Subject: [Buildroot] 2013.02: sysvinit-2.88 build failure undefined
	reference to -lcrypt
Message-ID: <CAG0mjpsiXECXSfAC2_K5GfwMhC76Tws-yw9ygst=_EMRAZG4tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

Sysvinit doesn't build on the following system:

Buildroot: 2013.02
OS: Ubuntu 12.10 x64

The problem looks very similar to this....
http://buildroot-busybox.2317881.n4.nabble.com/Bug-2401-New-sysvinit-2-86-fails-to-build-on-MIPS-because-is-missing-lcrypt-td6901.html

Compile output is basically the same as the link above:
sulogin.c:(.text+0xf94): undefined reference to `crypt'

As I understand the problem is this...

sysvinit's makefile can't find libcrypt.a and doesn't add -lcrypt to
sulogin.c linker options.

On 64bit ubuntu the libcrypt.a is located at
/usr/lib/x86_64-linux-gnu/libcrypt.a

Best regards,
Roland Uuesoo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130312/3a36e8f5/attachment-0001.html>
