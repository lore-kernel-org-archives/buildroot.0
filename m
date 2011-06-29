From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Wed, 29 Jun 2011 13:27:11 -0400
Subject: [Buildroot] buildroot tool chain won't support SPE abi?
Message-ID: <BANLkTi=OQK2-HSPZ0V3W3Kmsh5wioOcLZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
My platform is freescale P1020 CPU, which uses e500v2 core.
After tried and studied a few days, I think it is impossible to make
buildroot to support spe abi with uclibc. The reason is that the gcc
configure and build system need parse the tuple name of the target. My
understand is the tuple name could be powerpc-unkown-linux-uclibc or
powerpc-unkown-linux-gnuspe. Buildroot use uclibc one so that gcc
configure system will disable the spe abi for the target CPU.
So, here are my questions:
1. Am I right?
2. If I am right, is there any one know who or how to overcome this
problem. I like uclibc, but I also need the spe. My current solution
is to use eglibc, which is a little bigger than uclibc in size.

thanks,

Raymond
