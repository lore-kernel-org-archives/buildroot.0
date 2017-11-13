From: Arvid Picciani <aep@exys.org>
Date: Mon, 13 Nov 2017 14:31:31 +0100
Subject: [Buildroot] musl static pie
Message-ID: <CABukmmPJ0MbOF9YP+DoA15OCHU_8B9dEXYFz3X0194qcjSGcbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

musl does support static pie, which we need for implement linking with
korhal bolter.
Is there any general resistance against implement that?

as far as i understand this requires adding a .spec file, since gcc does
not natively understand static pie yet. A different crt needs to be added
for self-relocation without an ldso.
https://gcc.gnu.org/ml/gcc-patches/2017-11/msg00247.html

it would also involve adding -fPIC to TARGET_CFLAGS.

i'd suggest adding it as Build options -> position independant executables

but behind !BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL


/b/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171113/9a67e617/attachment.html>
