From: Dan Weinlader <danw@vs-networks.com>
Date: Wed, 14 Mar 2012 10:49:34 -0400
Subject: [Buildroot] Problem building kexec
Message-ID: <CAAPM0p5XvWNucLRprTccZGBo+9OxdN0vsCC0h-MW3CJCSNLVVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using Buildroot 2012.02 and trying to build it with kexec
selected on an x86_64 system:

> uname -a

Linux deploy 2.6.32-6-pve #1 SMP Mon Sep 26 06:32:53 CEST 2011 i686
Intel(R) Xeon(R) CPU X3210 @ 2.13GHz GenuineIntel GNU/Linux

(This is an OpenVZ container, but same issue occurs on both 64-bit and
32-bit linux workstations, running an up-to-date Gentoo install)

I am getting this error:

mkdir -p kexec
bin/bin-to-hex purgatory < purgatory/purgatory.ro > kexec/purgatory.c
/bin/sh: bin/bin-to-hex: No such file or directory

I believe this error is due to the kexec Makefile using the cross
compiler to build bin-to-hex which is then uses are part of the build
process. It should be using the host compiler instead and when I do
this manually, the build continues fine. I found a few previous
references to the problem:

http://lists.busybox.net/pipermail/buildroot/2010-June/035790.html
http://lists.busybox.net/pipermail/buildroot/2009-August/028973.html

Am I doing something wrong that this problem persists for me? Is there
a suggested patch I should apply? I would be happy to help fix this or
supply additional information if it would be helpful. Thank you.

 - Dan
