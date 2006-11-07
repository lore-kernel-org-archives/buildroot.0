From: Benjamin Delagoutte <benjamin.delagoutte@gmail.com>
Date: Tue, 7 Nov 2006 10:27:10 +0100
Subject: [Buildroot] User get prompted during uClibc compilation
Message-ID: <30f88efd0611070127u66e7c79ag67f963a9f7ed0364@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At least for 2 architectures (i386 and mips), user get prompted on the
command line while compiling uClibc, because of vague supplied uClibc
config. Some symbols don't exist anymore in uClibc newest versions or got
remplaced. Moreover, we need to specify the exact variant of the
architecture.

I made the choice of using CONFIG_MIPS_ISA_1 for mips and CONFIG_GENERIC_386
for i386, but we could as well replace this with a more optimized setup.

See attached patch.

Benjamin Delagoutte
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061107/aa06221a/attachment.html 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix_uclibc_questions.diff
Type: text/x-patch
Size: 3165 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061107/aa06221a/attachment.bin 
