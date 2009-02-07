From: w wg <duzuike@gmail.com>
Date: Sat, 7 Feb 2009 16:16:02 +0800
Subject: [Buildroot] Build ok, but the toolschain don't work
Message-ID: <2961e5a80902070016v1f102dcfq9e27915671ab7f1a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have built my project succesfully. But I the toolchains seems not
being work succesfully.



lfs at diy:~$ cat test.c
#include <stdio.h>

int main() {
        printf("Hello !\n");
}

i686-linux-gcc -o test test.c
echo $?
0

./test
-bash: ./test: No such file or directory

lfs at diy:~$ i686-linux-ldd test
checking sub-depends for '/lib/libgcc_s.so.1'
checking sub-depends for 'not found'
checking sub-depends for '/lib/libc.so.6'
        libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x00000000)
        libc.so.0 => not found (0x00000000)
        libc.so.6 => /lib/libc.so.6 (0x00000000)
        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x00000000)

Please help, Thank you.


-- 
--
WenGe Wang
