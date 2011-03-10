From: Will Newton <will.newton@gmail.com>
Date: Thu, 10 Mar 2011 10:27:49 +0000
Subject: [Buildroot] [PATCH] toolchain/gcc/4.2.4: Remove libstdc++ uClibc
	locale patches.
Message-ID: <AANLkTin7isvvLN28dLa9_ca_cCW0odc8FerFkDEwYeJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches do not build with more recent versions of uClibc
going back as far as at least 2008. More recent compiler versions
seem to do fine without these patches, so lets remove them so
libstdc++ locale support will actually build for gcc 4.2.4.

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 toolchain/gcc/4.2.4/200-uclibc-locale.patch        | 2790 --------------------
 toolchain/gcc/4.2.4/203-uclibc-locale-no__x.patch  |  213 --
 .../gcc/4.2.4/204-uclibc-locale-wchar_fix.patch    |   48 -
 toolchain/gcc/4.2.4/205-uclibc-locale-update.patch |  347 ---
 toolchain/gcc/4.2.4/306-libstdc++-namespace.patch  |   36 -
 5 files changed, 0 insertions(+), 3434 deletions(-)
 delete mode 100644 toolchain/gcc/4.2.4/200-uclibc-locale.patch
 delete mode 100644 toolchain/gcc/4.2.4/203-uclibc-locale-no__x.patch
 delete mode 100644 toolchain/gcc/4.2.4/204-uclibc-locale-wchar_fix.patch
 delete mode 100644 toolchain/gcc/4.2.4/205-uclibc-locale-update.patch
 delete mode 100644 toolchain/gcc/4.2.4/306-libstdc++-namespace.patch
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-toolchain-gcc-4.2.4-Remove-libstdc-uClibc-locale-pat.patch.gz
Type: application/x-gzip
Size: 18625 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110310/80bfd867/attachment.bin>
