From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Feb 2009 20:19:49 +0100
Subject: [Buildroot] Build ok, but the toolschain don't work
In-Reply-To: <2961e5a80902070016v1f102dcfq9e27915671ab7f1a@mail.gmail.com> (w.
	wg's message of "Sat\, 7 Feb 2009 16\:16\:02 +0800")
References: <2961e5a80902070016v1f102dcfq9e27915671ab7f1a@mail.gmail.com>
Message-ID: <87skmq836y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "w" == w wg <duzuike@gmail.com> writes:

 w> Hi,
 w> I have built my project succesfully. But I the toolchains seems not
 w> being work succesfully.


 w> lfs at diy:~$ cat test.c
 w> #include <stdio.h>

 w> int main() {
 w>         printf("Hello !\n");
 w> }

 w> i686-linux-gcc -o test test.c
 w> echo $?
 w> 0

 w> ./test
 w> -bash: ./test: No such file or directory

It doesn't find your uclibc C library. Either execute it in your
rootfs chroot, or compile statically.

-- 
Bye, Peter Korsgaard
