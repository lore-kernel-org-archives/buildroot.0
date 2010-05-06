From: =?ISO-8859-1?Q?Marc=2DAndr=E9_H=E9bert?= <hebert.marcandre@gmail.com>
Date: Thu, 6 May 2010 07:54:01 -0400
Subject: [Buildroot] Problem building wpa_supplicant using external toolchain
Message-ID: <i2i3e7e6aaa1005060454sda263981v97a394b1818a8c85@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I get an error when I try to get to building wpa_supplicant. I
configured buildroot to use CodeSourcery Lite 2009q1.

I tried both the 2010.02 stable release and the current git source
tree and obtained the same results.

The error I get is (I truncated the object list):
/home/vadmin/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-gcc
-o wpa_supplicant ... ../src/l2_packet/l2_packet_linux.o -lssl
-lcrypto -ldl
/home/vadmin/CodeSourcery/Sourcery_G++_Lite/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/ld:
cannot find -lssl

This fails because there is no libssl.so in the CodeSourcery
toolchain. But buildroot has built openssl just before so it is
available somewhere. It builds just fine if I manually instruct
wpa_supplicant to use the libssl from openssl.

Now if I understand how buildroot does things, I guess it should do
something like this:
-Copy libssl.so from openssl to the staging dir
-Configure wpa_supplicant to use --sysroot with the staging dir
-Copy the libssl.so to the target root fs

Or am I supposed to patch my external toolchain myself?
Thank you very much
Marc
