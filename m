From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Tue, 3 Aug 2010 10:11:21 +0530
Subject: [Buildroot] BR:libiconv issues on Lenny host
Message-ID: <AANLkTinFDDJzA8-wEMzp6ht--qH0cmnmh0acNFpTF4LZ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

The following error pops up often after a 'make' but goes away after a
"dpkg-reconfigure recode"

# Build the host utils. Need to add an install target...
/usr/bin/make -j1 -C /windows/buildroot/output/toolchain/uClibc-0.9.31/utils
\
PREFIX=/windows/buildroot/output/staging \
HOSTCC="/usr/bin/gcc" \
hostutils
make[1]: Entering directory
`/windows/buildroot/output/toolchain/uClibc-0.9.31/utils'
HOSTCC utils/ldconfig.host
HOSTCC utils/ldd.host
HOSTCC utils/iconv.host
/tmp/ccQqR1sV.o: In function `main':
iconv.c:(.text+0x1da): undefined reference to `libiconv_open'
iconv.c:(.text+0x2c8): undefined reference to `libiconv'
iconv.c:(.text+0x3c8): undefined reference to `libiconv_close'
collect2: ld returned 1 exit status
make[1]: *** [../utils/iconv.host] Error 1
make[1]: Leaving directory
`/windows/buildroot/output/toolchain/uClibc-0.9.31/utils'
make: *** [/windows/buildroot/output/staging/usr/lib/libc.a] Error 2


regards

Nataraj
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100803/da9b7fce/attachment.html>
