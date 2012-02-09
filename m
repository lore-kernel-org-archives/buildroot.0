From: Eial Czerwacki <eial@scalemp.com>
Date: Thu, 09 Feb 2012 16:48:30 +0200
Subject: [Buildroot] segfault when running a simple c program on env build
	with buildroot
Message-ID: <4F33DCBE.7080606@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

I have a small env built with buildroot based on busybox-1.19.2 and
uclibc-0.9.32.
I've included gcc into it and I'm trying to build and run the following
program but it segfaults:

sh-4.1# cat test.c
int main() { return 0; }
sh-4.1# gcc -o a test.c
sh-4.1# ls -l a
-rwxr-xr-x    1 root     root         11553 Feb  9 07:44 a
sh-4.1# ./a
Segmentation fault
sh-4.1# dmesg | tail -1
<6>[634724.545000] a[24405]: segfault at 0 ip (null) sp bfd8fc7c error 4

my buildroot config is attached and the version in use a snapshot from
the date 10/9/2011.

any ideas why?

Eial.
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120209/70e1170b/attachment-0001.ksh>
